import 'package:flutter/material.dart';

class StoryProvider extends ChangeNotifier {

  int _id;
  String _name;
  int _numOfQuestions;
  String _storyId;
  int _currentId;

  set setId(int id) {
    _id = id;
    notifyListeners();
  }

  set setName(String name) {
    _name = name;
    notifyListeners();
  }

  set _setNumOfQuestions(int num) {
    _numOfQuestions = num;
    notifyListeners();
  }

  set setStoryId(String story) {
    _storyId = story;
    notifyListeners();
  }

  set setCurrentId(int currentId) {
    _currentId = currentId;
    notifyListeners();
  }

  get getId => _id;
  get getName => _name;
  get getNumOfQuestions => _numOfQuestions;
  get getStoryId => _storyId;
  get getCurrentId => _currentId;

}