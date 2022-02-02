import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  var _opacity = 0.0;

  double get opacity => _opacity;

  changeOpacity(var value) {
    _opacity = value;
    notifyListeners();
  }
}
