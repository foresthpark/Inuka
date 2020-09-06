import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Page extends StatefulWidget {
  Page() : super();

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  static AudioCache player = AudioCache(prefix: 'audio/');

  // you can do that by using `Map` but for simplicity I used 2 separate `List`.
  List<int> _list = List.generate(20, (i) => i);
  List<bool> _selected = List.generate(20, (i) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
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
//                  icon: Icon(FontAwesome5.getIconData("question-circle")),
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Text("Do you think you may be pregnant?",
                        style:
                            TextStyle(fontSize: 30.0, color: Colors.grey[400])),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Je, unafikiri wewe unaweza kuwa mjamzito?",
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          color: InukaSecondary,
                          iconSize: 50.0,
                          onPressed: () {
                            player.play('5S.mp3');
                          },
                        ),
                      )),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Option(
                          patientText: 'ndio',
                          observerText: 'yes',
                          isSelected: false,
                        ),
                        Option(
                          patientText: 'hapana',
                          observerText: 'no',
                          isSelected: true,
                        ),
                        Option(
                          patientText: 'haijulikani',
                          observerText: 'unknown',
                          isSelected: false,
                        ),
                        Option(
                          patientText: 'haijulikani',
                          observerText: 'unknown',
                          isSelected: false,
                        ),
                        Option(
                          patientText: 'haijulikani',
                          observerText: 'unknown',
                          isSelected: false,
                        ),
                      ],
                    ),
                  ),
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
                                fontSize: 30.0, fontWeight: FontWeight.w600),
                          ),
                        )
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
                              onPressed: () {},
                            ),
                          ),
                        ),
//                        GestureDetector(
//                            child: Container(
//                                width: 100,
//                                height: 100,
//                                decoration: BoxDecoration(
//                                  color: InukaBackground,
//                                  image: DecorationImage(
//                                      image:AssetImage("assets/images/unknown.png"),
//                                      fit:BoxFit.cover
//                                  ),
//                                )
//                            ),
//                            onTap:(){
//                              print("you clicked my");
//                            }
//                        ),
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
                              onPressed: () {},
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
      ),
    );
  }
}

class Option extends StatelessWidget {
  const Option(
      {Key key, this.patientText, this.observerText, this.isSelected = false})
      : super(key: key);

  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  final bool isSelected;
  final String patientText;
  final String observerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.0),
        color: isSelected ? InukaPrimary : Colors.white,
      ),
      padding: EdgeInsets.all(15.0),
      child: RichText(
        text: TextSpan(
          text: '$patientText ',
          style: TextStyle(
            color: isSelected ? InukaBackground : Colors.black87,
            fontSize: 30.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '$observerText',
              style: TextStyle(
                fontSize: 30.0,
                color: isSelected ? Colors.black87 : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
