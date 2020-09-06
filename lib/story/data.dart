import '../page/Page.dart';
import '../page/Answer.dart';

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

  "name": "obstetric",
  "runTime": "25:44",
  "totalQuestions": 15,

  "pages": [
    {
      "id": 0,
      "question": "How are you feeling today?",
      "answer": "crying",
    },{
      "id": 1,
      "question": "When was your last menstrual period?",
      "answer": "One months ago",
    },{
      "id": 2,
      "question": "Do you Normally see your period every month?",
      "answer": "No",
    },{
      "id": 3,
      "question": "Do you think you may be pregnant?",
      "answer": "yes",
    },{
      "id": 4,
      "question": "Have you been pregnant before this one?",
      "answer": "no",
    },{
      "id": 5,
      "question": "How many times have you given birth?",
      "answer": "Three",
    },{
      "id": 6,
      "question": "Were any of your children delivered by surgery?",
      "answer": "Yes",
    },{
      "id": 7,
      "question": "How many of your children were delivered by cesarean section?",
      "answer": "More then two",
    },{
      "id": 8,
      "question": "Have you ever had a baby that did not cry after birth?",
      "answer": "No",
    },{
      "id": 9,
      "question": "How many babies have you given birth to that did Not cry after birth?",
      "answer": "Two",
    },{
      "id": 10,
      "question": "Have you ever had any problems during delivery?",
      "answer": "No",
    },{
      "id": 11,
      "question": "Have you had a baby that was born before nine months?",
      "answer": "No",
    },{
      "id": 12,
      "question": "Do you know why your baby was born before 9 months?",
      "answer": "Yes",
    },{
      "id": 13,
      "question": "Was your baby born before 9 months because of bleeding?",
      "answer": "No",
    },{
      "id": 14,
      "question": "Was your baby born before 9 months because your water broke?",
      "answer": "Yes",
    },

  ]
};

List<Page> pages = [
  Page(
    AnswerType.image,
    "How are you feeling today?",
    "Unajisikiaje leo?",
    "1S.mp3",
    [
      Answer(
        "neutral",
        "",
        imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "surprised",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "dissatisfied",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "happy",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "furious",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "crying",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "irritated",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
      Answer(
          "apologetic",
          "",
          imageFileLocation: "assets/images/pages/baby.gif"
      ),
    ],
    isCompleted: true
  ),
  Page(
      AnswerType.sound,
      "When was your last menstrual period?",
      "Je, hedhi yako ya mwisho uliiona lini?",
      "3S.mp3",
      [
        Answer(
          "This month?",
          "Mwezi huu?",
          isShort: false,
          soundFileLocation: "3S1.mp3",
        ),
        Answer(
          "One months ago?",
          "Mwezi mmoja uliopita?",
          isShort: false,
          soundFileLocation: "3S2.mp3",
        ),
        Answer(
          "Two months ago?",
          "Miezi miwili iliyopita?",
          isShort: false,
          soundFileLocation: "3S3.mp3",
        ),
        Answer(
          "Three months ago?",
          "Miezi mitatu iliyopita?",
          isShort: false,
          soundFileLocation: "3S4.mp3",
        ),
        Answer(
          "More than three months ago?",
          "Zaidi ya miezi tatu iliyopita?",
          isShort: false,
          soundFileLocation: "3S5.mp3",
        ),
      ],
      isCompleted: true
  ),
  Page(
    AnswerType.sound,
      "Do you Normally see your period every month?",
      "Je, huwa unaona hedhi yako kila mwezi?",
      "4S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ],
      isCompleted: true
  ),
  Page(
      AnswerType.sound,
      "Do you think you may be pregnant?",
      "Je, unafikiri wewe unaweza kuwa mjamzito?",
      "5S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ],
      isCompleted: true
  ),
  Page(
      AnswerType.sound,
      "Have you been pregnant before this one?",
      "Je, umewahi kuwa mjamzito kabla ya huu ujamzito?",
      "7S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ],
      isCompleted: true
  ),
  Page(
      AnswerType.sound,
      "How many times have you given birth? ",
      "Je, Umezaa mara ngapi?",
      "9S.mp3",
      [
        Answer(
          "One",
          "Moja",
          soundFileLocation: "8S1.mp3",
        ),
        Answer(
          "Two",
          "Mibli",
          soundFileLocation: "8S2.mp3",
        ),
        Answer(
          "Three",
          "Tatu",
          soundFileLocation: "8S3.mp3",
        ),
        Answer(
          "Four",
          "Nne",
          soundFileLocation: "8S4.mp3",
        ),
        Answer(
          "Five",
          "Tano",
          soundFileLocation: "8S5.mp3",
        ),
        Answer(
          "More than five",
          "Zaidi ya mara tano",
          isShort: false,
          soundFileLocation: "8S6.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Were any of your children delivered by surgery?",
      "Kuna watoto wowote uliwazaa kwa njia ya upasuaji?",
      "12S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "How many of your children were delivered by cesarean section?",
      "Ni watoto wangapi uliwazaa kwa njia ya upasuaji?",
      "13S.mp3",
      [
        Answer(
          "One",
          "Moja",
          soundFileLocation: "13S1.mp3",
        ),
        Answer(
          "Two",
          "Mbili",
          soundFileLocation: "13S2.mp3",
        ),
        Answer(
          "More then two",
          "Zaidi ya mbili",
          soundFileLocation: "13S3.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Have you ever had a baby that did not cry after birth?",
      "Umeshawahi kuwa mtoto ambaye hakulia baada ya kujifungua?",
      "26S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "How many babies have you given birth to that did Not cry after birth?",
      "Ni watoto wangapi uliowazaa lakini hawakulia baada ya kuzaliwa?",
      "27S.mp3",
      [
        Answer(
          "One",
          "Moja",
          soundFileLocation: "27S1.mp3",
        ),
        Answer(
          "Two",
          "Mbili",
          soundFileLocation: "27S2.mp3",
        ),
        Answer(
          "Three",
          "Tatu",
          soundFileLocation: "27S3.mp3",
        ),
        Answer(
          "More then three",
          "Zaidi ya tatu",
          isShort: false,
          soundFileLocation: "27S4.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Have you ever had any problems during delivery?",
      "Umeshawahi kuwa na tatizo lolote wakati wa kujifungua?",
      "28S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Have you had a baby that was born before nine months?",
      "Umeshawahi kuwa na mtoto aliyezaliwa kabla ya miezi tisa?",
      "33S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Do you know why your baby was born before 9 months?",
      "Je, unafahamu kwanini watoto wako walizaliwa kabla ya miezi tisa?",
      "34S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Was your baby born before 9 months because of bleeding?",
      "Je, mtoto wako alizaliwa kabla ya miezi 9 kwa sababu ya ktoka damu?",
      "35S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
  Page(
      AnswerType.sound,
      "Was your baby born before 9 months because your water broke?",
      "Je, mtoto wako alizaliwa kabla ya miezi 9 kwa sababu ya chupa kupasuka?",
      "36S.mp3",
      [
        Answer(
          "Yes",
          "Ndio",
          soundFileLocation: "YesS.mp3",
        ),
        Answer(
          "No",
          "Hapana",
          soundFileLocation: "NoS.mp3",
        ),
      ]
  ),
];