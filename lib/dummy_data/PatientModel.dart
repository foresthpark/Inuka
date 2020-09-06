import 'dart:io';

import 'package:flutter/material.dart';

class Patient {
  String patientTag;
  Data data;
  List<Questions> questions;

  Patient({
    @required this.patientTag,
    @required this.data,
    @required this.questions});

  Patient.fromJson(Map<String, dynamic> json) {
    patientTag = json['patient_tag'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_tag'] = this.patientTag;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  int age;
  bool smoker;

  Data({
    @required this.name,
    @required this.age,
    @required this.smoker});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    smoker = json['smoker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['smoker'] = this.smoker;
    return data;
  }
}

class Questions {
  int id;
  String question;
  String answer;

  Questions({
    @required this.id,
    @required this.question,
    @required this.answer
  });

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

/*
{
"patient_tag": "123456",
"data": {
"name": "Forest Park",
"age": 34,
"smoker": false
},
"questions": [
{
"id": 0,
"question": "What's your name?",
"answer": "No"
},
{
"id": 1,
"question": "Hello?",
"answer": "Yes"
},
{
"id": 2,
"question": "Question 3?",
"answer": "Answer 3"
},
{
"id": 3,
"question": "Question 4?",
"answer": "Answer 4"
}
]
}
 */