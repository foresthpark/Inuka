import 'package:inuka_app/page/patient_data_view.dart';
import 'package:inuka_app/page/patient_select_page.dart';
import 'package:inuka_app/widgets/ShowFlashBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future checkFirebaseForPatientTag(String hexCode, context) async {
  // ignore: cancel_subscriptions
  print('checkFirebaseForPatientTag');

  var usersRef = Firestore.instance.collection('patients').document(hexCode);

  await usersRef.get().then((docSnapshot) => {
        if (docSnapshot.exists)
          {
            Navigator.of(context).pushNamed(PatientDataView.namedRoute,
                arguments: {'hex': hexCode})
          }
        else
          {
            Navigator.of(context).pushNamed(PatientSelectPage.namedRoute,
                arguments: {'hex': hexCode}),
            showFlushBar(context)
          }
      });
}

Future checkFirebaseForPatientTag222(String hexCode, context) async {
  // ignore: cancel_subscriptions
  print('checkFirebaseForPatientTag2222222');

//  Navigator.pop(context);
//  var usersRef = Firestore.instance.collection('patients').document(hexCode);
//
//  await usersRef.get()
//      .then((docSnapshot) => {
//    if (docSnapshot.exists) {
//      Navigator.of(context).pushNamed(PatientDataView.namedRoute,
//          arguments: {
//            'hex': hexCode
//          }
//      )
//    } else {
//      Navigator.of(context).pushNamed(PatientSelectPage.namedRoute,
//          arguments: {
//            'hex': hexCode
//          }),
  showFlushBar(context);
}

Future postPatientDataToFirebase(String hexCode) async {
  String uniquePatientTag = hexCode;

  var newDocument =
      Firestore.instance.collection('patients').document("8e6d6a90");

  var storyJSON = {
    "patient_data": {
      "age": 34,
      "gender": "Female",
      "country": "Tanzania",
      "language": "Swahili",
      "weight": 92,
      "height": 175,
      "category": "Pregnant",
      "numOfChildren": 3,
    },
    "patient_tag": "8e6d6a90",
    "name": "obstetric",
    "runTime": "25:44",
    "totalQuestions": 15,
    "pages": [
      {
        "id": 0,
        "question": "How are you feeling today?",
        "answer": "crying",
      },
      {
        "id": 1,
        "question": "When was your last menstrual period?",
        "answer": "One months ago",
      },
      {
        "id": 2,
        "question": "Do you Normally see your period every month?",
        "answer": "No",
      },
      {
        "id": 3,
        "question": "Do you think you may be pregnant?",
        "answer": "yes",
      },
      {
        "id": 4,
        "question": "Have you been pregnant before this one?",
        "answer": "no",
      },
      {
        "id": 5,
        "question": "How many times have you given birth?",
        "answer": "Three",
      },
      {
        "id": 6,
        "question": "Were any of your children delivered by surgery?",
        "answer": "Yes",
      },
      {
        "id": 7,
        "question":
            "How many of your children were delivered by cesarean section?",
        "answer": "More then two",
      },
      {
        "id": 8,
        "question": "Have you ever had a baby that did not cry after birth?",
        "answer": "No",
      },
      {
        "id": 9,
        "question":
            "How many babies have you given birth to that did Not cry after birth?",
        "answer": "Two",
      },
      {
        "id": 10,
        "question": "Have you ever had any problems during delivery?",
        "answer": "No",
      },
      {
        "id": 11,
        "question": "Have you had a baby that was born before nine months?",
        "answer": "No",
      },
      {
        "id": 12,
        "question": "Do you know why your baby was born before 9 months?",
        "answer": "Yes",
      },
      {
        "id": 13,
        "question": "Was your baby born before 9 months because of bleeding?",
        "answer": "No",
      },
      {
        "id": 14,
        "question":
            "Was your baby born before 9 months because your water broke?",
        "answer": "Yes",
      },
    ]
  };

  await newDocument.setData(storyJSON);

  print("SUCCESS");
}
