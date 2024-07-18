import 'package:flutter/material.dart';

class DpadController extends ChangeNotifier {
  int _hashCodeSelected = 0;

  bool isFocus(int hashElement) => _hashCodeSelected == hashElement;

  updateFocus(int hashElement) {
    _hashCodeSelected = hashElement;
    notifyListeners();
  }
}
