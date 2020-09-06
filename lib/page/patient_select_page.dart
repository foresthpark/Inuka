import 'package:flutter/material.dart';

class PatientSelectPage extends StatelessWidget {
  static final String namedRoute = '/new-patient';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          print('pregnant');
                          Navigator.of(context).popAndPushNamed('/');
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Image.asset(
                                          'assets/random/pregnant.gif'),
                                    ),
                                    Text('Pregnant')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('kid');
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child:
                                          Image.asset('assets/random/kid.gif'),
                                    ),
                                    Text('New Born')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('boy');
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child:
                                          Image.asset('assets/random/boy.gif'),
                                    ),
                                    Text('Boy')
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  print('pregnant');
                                },
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child:
                                          Image.asset('assets/random/girl.gif'),
                                    ),
                                    Text('Girl')
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))),
              ]),
        ),
      ),
    );
  }
}
