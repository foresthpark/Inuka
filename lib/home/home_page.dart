import 'package:inuka_app/api_handlers/FirebaseApiCalls.dart';
import 'package:inuka_app/models/Patient.dart';
import 'package:inuka_app/page/nfc_scan_page.dart';
import 'package:inuka_app/page/patient_data_view.dart';
import 'package:inuka_app/page/patient_select_page.dart';
import 'package:inuka_app/providers/HexProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ChartWidget.dart';
import '../nfc/nfcHandlers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  bool nfc = false;

  void togglenfc() {
    setState(() {
      this.nfc = !this.nfc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<HexProvider>(
        builder: (context) => HexProvider(),
        dispose: (context, value) => value.dispose(),
        child: Container(
          child: nfc ? nfcIsOn() : nfcIsOff(),
        ));
  }

  Widget nfcIsOff() {
    return Container(
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                  color: InukaBackground,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'Recent Stories',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: InukaSecondary, fontSize: 20.0),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset('assets/icons/baby.gif'),
                                  ),
                                ),
                                Container(
                                    child: Text(
                                  'Obstetric',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: InukaSecondary, fontSize: 16.0),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/icons/bacteria.gif'),
                                  ),
                                ),
                                Container(
                                    child: Text(
                                  'Immunization',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: InukaSecondary, fontSize: 16.0),
                                )),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () => {},
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child:
                                        Image.asset('assets/icons/bread.gif'),
                                  ),
                                ),
                                Container(
                                    child: Text(
                                  'Diet',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: InukaSecondary, fontSize: 16.0),
                                )),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Text(
                  "Hourly Visits Trend",
                  style: TextStyle(color: InukaSecondary, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                height: 300.0,
                child: SimpleTimeSeriesChart.withSampleData(),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Text(
                  "Daily Visitors by Type",
                  style: TextStyle(color: InukaSecondary, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                height: 300.0,
                child: StackedBarChart.withSampleData(),
              ),
              Container(
                  height: 250.0,
                  color: InukaBackground,
                  padding: EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          'Please leave feedback!',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 30.0),
                        ),
                      ),
                      Text(
                        'We would love to hear your thoughts on how this app could be improved. Fill out our feedback form so we can make sure we effect more lives for the better.',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black45, fontSize: 16.0),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16.0),
                        height: 80.0,
                        child: RaisedButton(
                          onPressed: () {},
                          elevation: 5.0,
                          color: InukaAccent,
                          highlightColor: InukaAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0),
                          ),
                          child: Text(
                            "Let's GO!",
                            style: TextStyle(
                                fontSize: 28.0, color: InukaBackground),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 120.0,
                child: Container(
                  color: InukaBackground,
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      print("Emergency Button Clicked");
                      await postPatientDataToFirebase("test");
                    },
                    child: Container(
                      height: 120,
                      child: Image.asset('assets/icons/emergency.gif'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 120,
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            PatientSelectPage.namedRoute,
                          );
                        },
                        elevation: 5.0,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(55.0),
                        ),
                        color: InukaBackground,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset('assets/icons/patient.png'),
                            Text(
                              "HELP PATIENT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54),
                            ),
                          ],
                        )),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      print('Scan button clicked');
                      togglenfc();
                      String hex = await fetchHex();

                      await checkFirebaseForPatientTag(hex, context);

                      togglenfc();
                    },
                    child: Container(
                      height: 120,
                      child: Image.asset('assets/icons/scan.gif'),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget nfcIsOn() {
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
                    'Please Scan Patient Tag',
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
                      togglenfc();
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
}
