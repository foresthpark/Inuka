import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

//  _buildListItem(BuildContext context, DocumentSnapshot document) {
//    return Column(
//      children: <Widget>[
//
//        ListTile(
//          title: Text(
//            document.data["pages"][0]["answer"],
//            style: Theme.of(context).textTheme.headline,
//          ),
//          subtitle: Text('Name'),
//        ),
//
//      ],
//    );
//
//  }

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance
            .collection('patients')
            .document("8e6d6a90")
            .snapshots(),
        builder: (context, story) {
          if (!story.hasData) {
            return new CircularProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Scaffold(
                body: new ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.pinkAccent,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            title: Text(
                              story.data["pages"][index]["answer"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              story.data["pages"][index]["question"],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black38),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: story.data["pages"].length),
              ),
            );
          }
        });
  }
}
