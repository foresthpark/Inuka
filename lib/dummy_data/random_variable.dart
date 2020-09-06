import 'package:flutter/material.dart';


class RandomVariable extends ChangeNotifier{
  int _counter;
  String _name = 'Forest Park';

  set setCounter(int c) {
    _counter = c;
    notifyListeners();
  }

  set setName(String n) {
    _name = n;
    notifyListeners();
  }

  get getColor => _counter;
  get getName => _name;

}
