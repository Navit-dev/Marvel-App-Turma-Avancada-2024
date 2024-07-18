import 'dart:io';

import 'package:dio/io.dart';
import 'package:dio/dio.dart';

HttpClientAdapter getAdapter({
  HttpClient Function()? createHttpClient,
  bool Function(X509Certificate, String, int)? badCertificateCallback,
  bool Function(X509Certificate?, String, int)? validateCertificate,
  String Function(Uri)? findProxy,
}) => IOHttpClientAdapter(
        createHttpClient: () => (createHttpClient?.call() ?? HttpClient())
          ..badCertificateCallback = badCertificateCallback
          ..findProxy = findProxy,
        validateCertificate: validateCertificate,
      );