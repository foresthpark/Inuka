import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PatientViewData extends StatefulWidget {

  static final String namedRoute = '/patient-data-view';


  PatientViewData({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PatientViewDataState();
  }
}

class _PatientViewDataState extends State<PatientViewData> {



  _PatientViewDataState();


  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {

    return ListTile(
        title: Column(
          children: <Widget>[
              FloatingActionButton(
                child: Text(
                  'Click',
                ),
                onPressed: () {
//                  print(document.data['data']['name']);
                  print(document.data['patient_tag']);
                },
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  document.data['data']['name'],
                  style: Theme.of(context).textTheme.headline,
                ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                document.data['data']['age'].toString(),
                    style: Theme.of(context).textTheme.headline,
                  ),
            ),



//            Container(
//              child: Text(
//                document['age'],
//                style: Theme.of(context).textTheme.headline,
//              ),
//            ),
//
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                    document.data['data']['smoker'].toString(),
                    style: Theme.of(context).textTheme.headline,
                  ),
            ),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final reverseHex = routeArgs['hex'];

    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("patients")
            .document("dee6dfaa")
            .snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
            return Text('Loading...');

          } else {
            return ListView.builder(
                itemExtent: 500.0,
                itemCount: snapshot.data.length,
//                itemCount: 1,
                itemBuilder: (context, index) =>
                    _buildListItem(context, snapshot.data)
            );
          }
        },
      ),
    );
  }
}

