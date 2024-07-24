import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marvel_app/src/core/core.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.extra['external'] ?? false) {
      return super.onRequest(options, handler);
    }
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String publickey = Env.backendPublickey.value;
    String privatekey = Env.backendPrivatekey.value;
    String hash = CryptoUtils.getHash(
      Uint8List.fromList('$ts$privatekey$publickey'.codeUnits),
      algorithmName: 'MD5',
    );

    options.queryParameters.addAll({
      'ts': ts,
      'hash': hash.toLowerCase(),
      'apikey': publickey,
    });
    return super.onRequest(options, handler);
  }
}
