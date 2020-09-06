import 'package:inuka_app/nfc/nfcHandlers.dart';
import 'package:inuka_app/page/Page.dart';
import 'package:inuka_app/story/Story.dart';
import 'package:inuka_app/widgets/ShowFlashBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:inuka_app/api_handlers/FirebaseApiCalls.dart';
import 'package:inuka_app/page/Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Playlist.dart';
import 'data.dart';

class StoryPage extends StatefulWidget {
  StoryPage({Key key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  static var utcStart = new DateTime.now().toUtc();

  final story = new Story("OBSTETRIC", utcStart, pages);

  bool _save = false;

  void toggleSave() {
    setState(() {
      _save = !_save;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _save ? saveOn(context) : saveOff(context));
  }

  Widget saveOn(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return new Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('texstst');
                    },
                    child: Container(
                      child: Image.asset(
                        'assets/icons/scan_patient.gif',
                        height: height * 0.33,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please Scan Patient Tag to Save Info',
                    style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      toggleSave();

                      await fetchHex();

//                      await checkFirebaseForPatientTag222(hex, context);
                      showFlushBar222(context);
                      toggleSave();
                    },
                    child: Container(
                      child: Image.asset('assets/icons/cancel_button.png'),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget saveOff(context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          color: InukaPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${story.name}",
                        style:
                            TextStyle(color: InukaBackground, fontSize: 35.0),
                      ),
                      Text.rich(TextSpan(
                          text: "${story.completed} / ${story.total}",
                          style: TextStyle(color: InukaBackground),
                          children: <TextSpan>[
                            TextSpan(
                              text: "  Completed",
                              style:
                                  TextStyle(color: InukaAccent, fontSize: 15.0),
                            )
                          ])),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Time Started:",
                      style: TextStyle(color: InukaBackground, fontSize: 20.0),
                    ),
                    Text(
                      "${story.time}",
                      style: TextStyle(color: InukaBackground, fontSize: 30.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: <Widget>[
              Playlist(),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 110.0,
                      width: 130.0,
                      padding:
                          EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        onPressed: () {},
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(55.0),
                        ),
                        color: InukaSecondary,
                        child: Text(
                          "RESET",
                          style:
                              TextStyle(fontSize: 20.0, color: InukaBackground),
                        ),
                      ),
                    ),
                    Container(
                      height: 130.0,
                      width: 130.0,
                      padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, PageContainer.namedRoute);
                        },
                        elevation: 5.0,
                        shape: CircleBorder(),
                        color: InukaAccent,
                        child: Icon(Icons.play_arrow,
                            size: 35.0, color: InukaBackground),
                      ),
                    ),
                    Container(
                      height: 110.0,
                      width: 130.0,
                      padding:
                          EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        onPressed: () async {
                          print("Save button pressed");
                          toggleSave();
                          print(_save);
                        },
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(55.0),
                        ),
                        color: InukaSecondary,
                        child: Text(
                          "SAVE",
                          style:
                              TextStyle(fontSize: 20.0, color: InukaBackground),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
