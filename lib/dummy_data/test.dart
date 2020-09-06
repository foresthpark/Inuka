import 'PatientModel.dart';


final question1 = new Questions(id: 0, question: "hello", answer: "yes");
final question2 = new Questions(id: 1, question: "hello", answer: "yes");
final question3 = new Questions(id: 2, question: "hello", answer: "yes");
final question4 = new Questions(id: 3, question: "hello", answer: "yes");
final question5 = new Questions(id: 4, question: "hello", answer: "yes");

List questions;

//questions

final data = new Data(name: "Forest Park", age: 34, smoker: false);

final patient = new Patient(
    patientTag: "123456",
    data: data,
    questions: [question1,question2,question3,question4,question5]
);

// Patient type
// Gender
// Language
