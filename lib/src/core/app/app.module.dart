import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/characters/characters.module.dart';
import 'package:marvel_app/src/modules/home/home.module.dart';
import 'package:marvel_app/src/core/core.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance<Dio>(NavitDio(
      globalInterceptor: [
        AuthInterceptor(),
        LoggerInterceptor(),
      ],
    ));
    i.addInstance(NavitHttpClient(dio: i()));
  }

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/characters', module: CharactersModule());
  }
}
