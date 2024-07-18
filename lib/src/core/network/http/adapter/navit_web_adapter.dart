import 'dart:io';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

HttpClientAdapter getAdapter({
  HttpClient Function()? createHttpClient,
  bool Function(X509Certificate, String, int)? badCertificateCallback,
  bool Function(X509Certificate?, String, int)? validateCertificate,
  String Function(Uri)? findProxy,
}) => BrowserHttpClientAdapter();