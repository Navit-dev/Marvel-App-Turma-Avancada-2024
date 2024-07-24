import 'package:dio/dio.dart';
import 'package:marvel_app/src/core/network/http/navit_exception.dart';
import 'package:marvel_app/src/core/network/http/navit_request.dart';
import 'package:marvel_app/src/core/network/http/navit_response.dart';

class NavitHttpClient {
  final Dio dio;

  NavitHttpClient({required this.dio});

  Future<bool> checkPinning(DioException error,
      {String url = '', Map<String, dynamic>? queryParameters}) async {
    bool secure = false;
    if (!(error.message ?? '').contains('CERTIFICATE_VERIFY_FAILED')) {
      secure = true;
    }
    return secure;
  }

  Future<NavitResponse> request(INavitRequest request) async {
    try {
      final Response response = await dio.request(
        request.path,
        data: request.body,
        queryParameters: request.queryParams,
        options: Options(
          method: request.method.toString(),
          headers: request.headers,
          extra: request.extras,
        ),
      );
      // final Map<String, dynamic> body = {
      //   if (response.data is String) ...{
      //     'body': response.data,
      //   } else if (response.data is Map<String, dynamic>) ...{
      //     ...response.data,
      //   }
      // };

      if (response.statusCode != null) {
        return NavitResponse(
          response.statusCode ?? 989,
          response.statusMessage ?? 'SUCESSO',
          response.data,
          response.headers.map.map((String key, List<String> value) =>
              MapEntry<String, dynamic>(key, value.join(','))),
        );
      } else {
        return NavitResponse(
          response.statusCode ?? 989,
          response.statusMessage ?? 'ERRO AO RECEBER MSG',
          response.data,
          response.headers.map.map((String key, List<String> value) =>
              MapEntry<String, dynamic>(key, value.join(','))),
        );
      }
    } on NavitHttpException catch (e) {
      throw NavitHttpException(e.statusCode, e.statusMessage, e.data);
    } on DioException catch (e, s) {
      if (!await checkPinning(e)) {
        throw NavitHttpException(999, 'Sem conexão', {
          'messageError': 'Conexão instável. Verifique sua rede de internet.'
        });
      } else if (e.response?.statusCode != null) {
        return NavitResponse(
          e.response?.statusCode ?? 989,
          e.response?.statusMessage ?? 'ERRO AO RECEBER MSG',
          e.response?.data,
          {
            if (!(e.response?.headers.isEmpty ?? true)) ...{
              ...e.response?.headers.map.map((String key, List<String> value) =>
                      MapEntry<String, dynamic>(key, value.join(','))) ??
                  {},
            },
          },
        );
      } else {
        throw NavitHttpException(
          e.response?.statusCode ?? 989,
          e.message ?? 'ERRO AO RECEBER MSG',
          {
            if (e.error != null) ...{
              'error': e.error,
              'stacktrace': e.stackTrace,
            },
            if (e.response?.data is String) ...{
              'body': e.response?.data,
            },
            if (e.response?.data is Map<String, dynamic>) ...{
              ...e.response?.data,
            }
          },
        );
      }
    } catch (e) {
      throw NavitHttpException(
        989,
        'ERRO AO RECEBER MSG',
        {
          'messageError': e.toString(),
        },
      );
    }
  }
}
