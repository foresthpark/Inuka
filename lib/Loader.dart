import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            color: InukaSecondary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200.0,
//                          padding: EdgeInsets.only(top: 100.0),
                          alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (_) => false);
                              },
                              child: Image.asset('assets/logo.png'),
                            )
                        ),
                      Container(
                        child: Text(
                              "INUKA",
                              style: TextStyle(color: InukaBackground, fontSize: 60.0, fontWeight: FontWeight.w800, letterSpacing: 10.0)
                          ),
                        ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 80.0),
                        child: Text(
                            "LOADING",
                            style: TextStyle(color: InukaBackground, fontSize: 25.0, fontWeight: FontWeight.w800, letterSpacing: 5.0)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20.0),
                        alignment: Alignment.center,
                        child: SpinKitChasingDots(color: InukaAccent, size: 40.0),
                      ),
                    ],
                  ),
                ),
              ),
        );
  }
}
