import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../story/data.dart';
import 'Answer.dart';

enum AnswerType {
  image,
  sound,
}

class Page {
  final AnswerType answerType;
  final String userQuestion;
  final String patientQuestion;
  final String soundFileLocation;
  final bool isCompleted;
  final List<Answer> answers;

  Answer patientAnswer;

  Page(this.answerType, this.userQuestion, this.patientQuestion,
      this.soundFileLocation, this.answers,
      {this.isCompleted = true});
}

class PageContainer extends StatefulWidget {
  PageContainer({Key key, this.page}) : super(key: key);

  static final String namedRoute = '/page';

  final Page page;

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  int selectedOption;

  @override
  Widget build(BuildContext context) {
    print(widget.page);
    return SafeArea(
      child: Material(
          type: MaterialType.transparency,
          child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) {
              var x = details.velocity.pixelsPerSecond.dx;
              print(x);
              if (x > 0) {
                // Navigator.pushNamed(context, PageContainer.namedRoute, arguments: pages[4]);
              }
            },
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 50,
                    alignment: Alignment.topRight,
                    child: IconButton(
//                   icon: Icon(FontAwesome5.getIconData("question-circle")),
                      color: InukaPrimary,
                      iconSize: 40.0,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 25.0),
                        alignment: Alignment.centerLeft,
                        child: Text("${widget.page.userQuestion}",
                            style: TextStyle(
                                fontSize: 30.0, color: Colors.grey[400])),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.page.patientQuestion}",
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                      widget.page.answerType == AnswerType.sound
                          ? SoundPage(widget.page)
                          : null,
                    ],
                  )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    color: InukaBackground,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Text(
                                "Confirm?",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              height: 110.0,
                              width: 110.0,
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.check),
                                  color: InukaAccent,
                                  iconSize: 80.0,
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/page2");
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 110.0,
                              width: 110.0,
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  color: InukaSecondary,
                                  iconSize: 80.0,
                                  onPressed: () {
                                    Navigator.popUntil(
                                        context, ModalRoute.withName('/'));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class SoundPage extends StatelessWidget {
  final Page page;

  const SoundPage(this.page);

  static AudioCache player = new AudioCache(prefix: 'audio/');
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(Icons.volume_up),
                    color: InukaSecondary,
                    iconSize: 50.0,
                    onPressed: () {
                      player.play(page.soundFileLocation);
                    },
                  ),
                ),
              ),
              Expanded(child: Options(answers: page.answers)),
            ],
          )),
    );
  }
}
