import 'package:marvel_app/src/core/core.dart';

mixin SuccessMarvelState<T> {
  late final T value;
}

mixin ErrorMarvelState<T extends MarvelAppException> {
  late final T error;
}
