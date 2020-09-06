import 'package:inuka_app/page/patient_select_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../story/story_page.dart';
import 'ChartWidget.dart';

class HomePage extends StatelessWidget {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                height: 150.0,
                color: InukaPrimary,
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'AD SPACE',
                  style: TextStyle(color: InukaBackground, fontSize: 20.0),
                ),
              ),
              Container(
//                height: 200.0,
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
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StoryPage()));
                                  },
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
              SizedBox(
                height: 120.0,
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
                  child: Container(
                    height: 120,
                    child: Image.asset('assets/icons/emergency.gif'),
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
                                  fontSize: 20.0,
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
                  child: Container(
                    height: 120,
                    child: Image.asset('assets/icons/scan.gif'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
