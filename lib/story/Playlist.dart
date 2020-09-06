import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'data.dart';

class Playlist extends StatefulWidget {
  Playlist({Key key, this.id}) : super(key: key);
  final int id;

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {

  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  final id = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 10.0),
      child: timelineModel(TimelinePosition.Left),
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: centerTimelineBuilder,
      itemCount: pages.length,
      physics: position == TimelinePosition.Left
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      position: position);

  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    final page = pages[i];

    return TimelineModel(
        InkWell(
          onTap: () {
            // got to page with same id
          },
          child: Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: InukaPrimary,
                      radius: 15,
                      child: Text(
                        '${i+1}',
                        style: TextStyle(
                            color: InukaBackground, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("${page.userQuestion}", style: TextStyle(fontSize: 20.0),),
                    ),
                  ),
                ],
              )
          ),
        ),
        position: TimelineItemPosition.left,
        isFirst: i == 0,
        isLast: i == pages.length,
        iconBackground: InukaSecondary,
        icon: page.isCompleted ? Icon(Icons.check_circle_outline, color: InukaBackground) :
          Icon(Icons.fiber_manual_record, size: 20.0, color: InukaBackground,));
  }
}