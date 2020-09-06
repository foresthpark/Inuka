import 'package:flutter/material.dart';

class HexProvider extends ChangeNotifier{
  String _hexCode;

  set setHexCode (String hexCode) {
    _hexCode = hexCode;
    notifyListeners();
  }

  get getHexCode => _hexCode;
}