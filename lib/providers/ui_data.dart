import 'package:flutter/material.dart';

class UIData with ChangeNotifier {
  double _keyBoardHeight = 0;

  void setKeyboardHeight(double height) {
    if (height == 0)
      _keyBoardHeight = 0;
    else
      _keyBoardHeight = height + 38;
    notifyListeners();
  }

  get getKeyboardHeight {
    return _keyBoardHeight;
  }
}
