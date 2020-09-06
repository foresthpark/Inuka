class Patient {
  String patientTag;
  Data data;
  List<Questions> questions;

  Patient({this.patientTag, this.data, this.questions});

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

  Data({this.name, this.age, this.smoker});

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

  Questions({this.id, this.question, this.answer});

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