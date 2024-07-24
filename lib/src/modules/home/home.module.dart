import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/core/core.dart';
import 'package:marvel_app/src/modules/home/presentation/home.page.dart';
import 'package:marvel_app/src/modules/home/search/bloc/search.bloc.dart';
import 'package:marvel_app/src/modules/home/search/presentation/search_delegate.page.dart';
import 'package:marvel_app/src/modules/home/search/search.controller.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addInstance<SearchBloc>(SearchBloc());
    i.addInstance<SearchChampionController>(SearchChampionController(http: marvelDI<NavitHttpClient>(), bloc: i.get()));
    i.addInstance<SearchDelegate<String>>(SearchDelegatePage(i.get()));
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
  }
}
