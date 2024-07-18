import 'dart:io';

import 'package:dio/dio.dart';

import 'adapter/navit_adapter.dart';

class NavitDio with DioMixin implements Dio {
  final List<Interceptor> globalInterceptor;

  NavitDio({
    this.globalInterceptor = const <Interceptor>[],
  }) {
    interceptors.addAll(<Interceptor>[
      ...globalInterceptor,
    ]);
  }

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: 'https://gateway.marvel.com:443',
      );

  SecurityContext get _securityContext {
    final SecurityContext sc = SecurityContext();
    // _sc.setTrustedCertificates('file');
    // _sc.usePrivateKey('file');
    // _sc.useCertificateChain('file');
    return sc;
  }

  HttpClient get _createHttpClient => HttpClient(context: _securityContext);

  bool _badCertificateCallback(X509Certificate cert, String host, int port) {
    return true;
  }

  bool _validateCertificate(X509Certificate? cert, String host, int port) {
    return true;
  }

  String find(Uri _) {
    return "DIRECT";
  }

  @override
  HttpClientAdapter get httpClientAdapter => getAdapter(
        createHttpClient: () => _createHttpClient,
        badCertificateCallback: _badCertificateCallback,
        validateCertificate: _validateCertificate,
        findProxy: find,
      );
}
