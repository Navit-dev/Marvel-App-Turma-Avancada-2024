import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/modules/home/presentation/home.page.dart';
import 'package:marvel_app/src/modules/home/presentation/search_delegate.page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addInstance<SearchDelegate<String>>(SearchDelegatePage());
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
  }
}
