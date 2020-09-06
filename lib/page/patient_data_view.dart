import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientDataView extends StatelessWidget {
  static final String namedRoute = '/patient-data-view';

  PatientDataView();

  _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            document.data["test"]["name"],
            style: Theme.of(context).textTheme.headline,
          ),
          subtitle: Text('Name'),
        ),
        ListTile(
          title: Text(
            document.data["test"]["age"].toString(),
            style: Theme.of(context).textTheme.headline,
          ),
          subtitle: Text('Age'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final hexCode = routeArgs['hex'];

    return Scaffold(
        body: new StreamBuilder(
      stream: Firestore.instance
          .collection('patients')
          .document(hexCode)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text('Loading');
        } else {
          return new ListView.builder(
              itemExtent: 500.0,
              itemCount: 1,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data));
        }
      },
    ));
  }
}
