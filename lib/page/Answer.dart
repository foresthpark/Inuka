import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Answer {
  final String userAnswer;
  final String patientAnswer;
  final String imageFileLocation;
  final String soundFileLocation;
  final bool isShort;

  bool isSelected = false;

  Answer(this.userAnswer, this.patientAnswer,
      {this.isShort = true,
      this.imageFileLocation = "",
      this.soundFileLocation = ""});
}

class Options extends StatefulWidget {
  const Options({Key key, this.answers}) : super(key: key);

  final List<Answer> answers;

  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  static AudioCache player = AudioCache(prefix: 'audio/');

  int selectedAnswer;

  void highlight(int position) {
    setState(() {
      widget.answers.forEach((answer) => answer.isSelected = false);
      selectedAnswer = position;
      widget.answers[position].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.answers.length,
        itemBuilder: (context, position) {
          return GestureDetector(
              onTap: () {
                player.play(widget.answers[position].soundFileLocation);
                highlight(position);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50.0),
                  color: widget.answers[position].isSelected ? InukaPrimary : Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                    '${widget.answers[position].userAnswer}${widget.answers[position].isShort ? '  ' : '\n'}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: widget.answers[position].isSelected
                          ? Colors.black87
                          : Colors.grey[400],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.answers[position].patientAnswer}',
                        style: TextStyle(
                          color: widget.answers[position].isSelected
                              ? InukaBackground
                              : Colors.black87,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          );
        }
    );
  }
}