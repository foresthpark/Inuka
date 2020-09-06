import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {

  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 40,
                color: InukaBackground,
              ),
            ),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context,);
                    },
                    child: CircleAvatar(
                      backgroundColor: InukaAccent,
                      radius: 30,
                      child: Icon(Icons.close),
                    ),
                  )
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: InukaBackground,
                  child: Row(
                    children: <Widget>[
                      Text("First")
                    ],
                  ),
                )
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        )
    );
  }
}