import 'package:flutter/material.dart';

class QuestionPageProvider extends ChangeNotifier {

  int _id;
  bool _isComplete;
  String _question;
  String _answered;
  String _answers;

  set setId (int id) {
    _id = id;
    notifyListeners();
  }

  set setIsComplete(bool isComplete) {
    _isComplete = isComplete;
    notifyListeners();
  }

  set setQuestion (String question) {
    _question = question;
    notifyListeners();
  }

  set setAnswered (String answered) {
    _answered = answered;
    notifyListeners();
  }

  set setAnswers (String answers) {
    _answers = answers;
    notifyListeners();
  }

  get getId => _id;
  get getIsComplete => _isComplete;
  get getQuestion => _question;
  get getAnswered => _answered;
  get getAnswers => _answers;

}