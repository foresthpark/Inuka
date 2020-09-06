import 'package:inuka_app/page/patient_data_view.dart';
import 'package:inuka_app/page/patient_select_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Loader.dart';
import 'page/Page.dart';
import 'root/RootPage.dart';
import 'settings/SettingPage.dart';
import 'story/data.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); // App only works in portrait mode
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 420,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'INUKA',
          theme: ThemeData(
            primaryColor: InukaSecondary,
          ),
          initialRoute: '/loading',
          routes: {
            '/': (BuildContext context) => RootPage(),
            '/loading': (BuildContext context) => Loader(),
            PageContainer.namedRoute: (BuildContext context) =>
                PageContainer(page: pages[5]),
            '/settings': (BuildContext context) => SettingPage(),
            '/page2': (BuildContext context) => PageContainer(page: pages[6]),
            PatientDataView.namedRoute: (BuildContext context) =>
                PatientDataView(),
            PatientSelectPage.namedRoute: (BuildContext context) =>
                PatientSelectPage(),
          },
        ),
      ),
    );
  }
}
