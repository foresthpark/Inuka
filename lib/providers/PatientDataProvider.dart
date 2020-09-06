import 'package:flutter/material.dart';

class PatienDataProvdier extends ChangeNotifier {

  String _name;
  String _language;
  String _gender;
  int _age;
  int _weight;
  int _height;
  String _country;
  int _numOfChildren;
  String _category;

  set setName (String name) {
    _name = name;
    notifyListeners();
  }

  set setLanguage (String language) {
    _language = language;
    notifyListeners();
  }

  set setGender (String gender) {
    _gender = gender;
    notifyListeners();
  }

  set setAge (int age) {
    _age = age;
    notifyListeners();
  }

  set setWeight (int weight) {
    _weight = weight;
    notifyListeners();
  }

  set setHeight (int height) {
    _height = height;
    notifyListeners();
  }

  set setCountry(String country) {
    _category = country;
    notifyListeners();
  }

  set setNumOfChildren (int num) {
    _numOfChildren = num;
    notifyListeners();
  }

  set setCategory (String category) {
    _category = category;
    notifyListeners();
  }

  get getName => _name;
  get getLanguage => _language;
  get getGender => _gender;
  get getAge => _age;
  get getWeight => _weight;
  get getHeight => _height;
  get getCountry => _country;
  get getNumOfChildren => _numOfChildren;
  get getCategory => _category;

}