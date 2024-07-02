import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/src/core/core.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const AppPage()));
}
