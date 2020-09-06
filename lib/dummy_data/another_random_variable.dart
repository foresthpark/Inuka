import 'package:flutter/material.dart';


class AnotherRandomVariable extends ChangeNotifier{
  int _age;
  String _hobby;

  set setAge(int c) {
    _age = c;
    notifyListeners();
  }

  set setHobby(String n) {
    _hobby = n;
    notifyListeners();
  }

  get getAge => _age;
  get getHobby => _hobby;

}
