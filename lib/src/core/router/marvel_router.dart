import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// final MarvelRouter = Modular.to;

class MarvelRouter {
  static Future<T?> push<T extends Object?>(Route<T> route) =>
      Modular.to.push<T>(route);

  static Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
    bool forRoot = false,
  }) =>
      Modular.to.popAndPushNamed<T, TO>(
        routeName,
        result: result,
        arguments: arguments,
        forRoot: forRoot,
      );

  static Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
    bool forRoot = false,
  }) =>
      Modular.to.pushNamed<T>(
        routeName,
        arguments: arguments,
        forRoot: forRoot,
      );

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
    bool forRoot = false,
  }) =>
      Modular.to.pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
        arguments: arguments,
        forRoot: forRoot,
      );

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
    bool forRoot = false,
  }) =>
      Modular.to.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
        forRoot: forRoot,
      );

  static void pop<T extends Object?>([T? result]) => Modular.to.pop<T?>(result);

  static bool canPop() => Modular.to.canPop();

  static void popUntil(bool Function(Route<dynamic>) predicate) =>
      Modular.to.popUntil(predicate);
}
