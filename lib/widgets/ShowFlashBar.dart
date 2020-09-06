import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showFlushBar(BuildContext context) async {
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Flushbar(
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(8.0),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.blue[600], Colors.blue[500]],
        stops: [0.5, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        )
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      title: "Patient data doesn't exist",
      message: "Redirecting to patient register page",
      mainButton: FlatButton(
        child: Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    )..show(context),
  );
}

void showFlushBar222(BuildContext context) async {
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Flushbar(
      duration: Duration(seconds: 3),
      padding: EdgeInsets.all(8.0),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.blue[600], Colors.blue[500]],
        stops: [0.5, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        )
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      title: "Patient data saved",
      message: "Please check patient history",
      mainButton: FlatButton(
        child: Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    )..show(context),
  );
}
