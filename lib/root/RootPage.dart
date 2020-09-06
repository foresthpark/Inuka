import 'package:flutter/material.dart';

import '../files/FilesPage.dart';
import '../history/HistoryPage.dart';
import '../home/home_page.dart';
import '../story/story_page.dart';

class RootPage extends StatefulWidget {
  static final String namedRoute = '/root';

  @override
  State<StatefulWidget> createState() {
    return RootPageState();
  }
}

class RootPageState extends State<RootPage> {
  int _selectedPage = 0;
  var _pageName = "INUKA";

  final _pageOptions = [
    HomePage(),
    FilesPage(),
    StoryPage(),
    HistoryPage(),
  ];

  static const InukaBackground = Color.fromRGBO(232, 238, 244, 1);
  static const InukaAccent = Color.fromRGBO(233, 30, 99, 1);
  static const InukaPrimary = Color.fromRGBO(34, 55, 111, 1);
  static const InukaSecondary = Color.fromRGBO(28, 43, 90, 1);

  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            padding:
                EdgeInsets.only(top: statusBarHeight, left: 15.0, right: 15.0),
            color: InukaSecondary,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _selectedPage == 0
                      ? Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 5.0,
                            color: InukaBackground,
                          ),
                        )
                      : Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            color: InukaBackground,
                          ),
                        ),
                ),
                Theme(
                  data: new ThemeData(canvasColor: InukaSecondary),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down,
                        color: InukaAccent, size: 40.0),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: InukaBackground,
                        backgroundColor: InukaSecondary,
                        fontSize: 20.0),
                    underline: Container(
                        margin: EdgeInsets.only(bottom: 0.0),
                        height: 3,
                        color: InukaBackground),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['English', 'Sukuma', 'Swahili']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/settings');
                    },
                    child: CircleAvatar(
                      backgroundColor: InukaAccent,
                      radius: 25,
                      child: Text(
                        'RR',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              currentIndex: _selectedPage,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: InukaSecondary,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;

                  switch (index) {
                    case 0:
                      {
                        _pageName = "INUKA";
                      }
                      break;

                    case 1:
                      {
                        _pageName = "Files";
                      }
                      break;

                    case 2:
                      {
                        _pageName = "Story";
                      }
                      break;

                    case 3:
                      {
                        _pageName = "History";
                      }
                      break;

                    case 4:
                      {
                        _pageName = "Settings";
                      }
                      break;

                    default:
                      break;
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/home.png'),
                    ),
                    title: Text("Home")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/files.png'),
                  ),
                  title: Text("Files"),
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/story.png'),
                    ),
                    title: Text("Story")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/history.png'),
                  ),
                  title: Text("History"),
                ),
              ]),
        ));
  }

  Widget yesArgs(context, page) {
    print('YESARG LOADED');
    double statusBarHeight = MediaQuery.of(context).padding.top;

    void initState() {
      setState(() {
        _selectedPage = page;
      });
    }

    initState();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            padding:
                EdgeInsets.only(top: statusBarHeight, left: 15.0, right: 15.0),
            color: InukaSecondary,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _selectedPage == 0
                      ? Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 5.0,
                            color: InukaBackground,
                          ),
                        )
                      : Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            color: InukaBackground,
                          ),
                        ),
                ),
                Theme(
                  data: new ThemeData(canvasColor: InukaSecondary),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down,
                        color: InukaAccent, size: 40.0),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: InukaBackground,
                        backgroundColor: InukaSecondary,
                        fontSize: 20.0),
                    underline: Container(
                        margin: EdgeInsets.only(bottom: 0.0),
                        height: 3,
                        color: InukaBackground),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['English', 'Sukuma', 'Swahili']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/settings');
                    },
                    child: CircleAvatar(
                      backgroundColor: InukaAccent,
                      radius: 25,
                      child: Text(
                        'RR',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              currentIndex: 3,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: InukaSecondary,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;

                  switch (index) {
                    case 0:
                      {
                        _pageName = "INUKA";
                      }
                      break;

                    case 1:
                      {
                        _pageName = "Files";
                      }
                      break;

                    case 2:
                      {
                        _pageName = "Story";
                      }
                      break;

                    case 3:
                      {
                        _pageName = "History";
                      }
                      break;

                    case 4:
                      {
                        _pageName = "Settings";
                      }
                      break;

                    default:
                      break;
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/home.png'),
                    ),
                    title: Text("Home")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/files.png'),
                  ),
                  title: Text("Files"),
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/story.png'),
                    ),
                    title: Text("Story")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/history.png'),
                  ),
                  title: Text("History"),
                ),
              ]),
        ));
  }

  Widget noArgs(context) {
    print('NO_ARG LOADED');

    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Container(
            padding:
                EdgeInsets.only(top: statusBarHeight, left: 15.0, right: 15.0),
            color: InukaSecondary,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: _selectedPage == 0
                      ? Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 5.0,
                            color: InukaBackground,
                          ),
                        )
                      : Text(
                          _pageName,
                          style: TextStyle(
                            fontSize: 40,
                            color: InukaBackground,
                          ),
                        ),
                ),
                Theme(
                  data: new ThemeData(canvasColor: InukaSecondary),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down,
                        color: InukaAccent, size: 40.0),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        color: InukaBackground,
                        backgroundColor: InukaSecondary,
                        fontSize: 20.0),
                    underline: Container(
                        margin: EdgeInsets.only(bottom: 0.0),
                        height: 3,
                        color: InukaBackground),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['English', 'Sukuma', 'Swahili']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/settings');
                    },
                    child: CircleAvatar(
                      backgroundColor: InukaAccent,
                      radius: 25,
                      child: Text(
                        'RR',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              currentIndex: _selectedPage,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: InukaSecondary,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;

                  switch (index) {
                    case 0:
                      {
                        _pageName = "INUKA";
                      }
                      break;

                    case 1:
                      {
                        _pageName = "Files";
                      }
                      break;

                    case 2:
                      {
                        _pageName = "Story";
                      }
                      break;

                    case 3:
                      {
                        _pageName = "History";
                      }
                      break;

                    case 4:
                      {
                        _pageName = "Settings";
                      }
                      break;

                    default:
                      break;
                  }
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/home.png'),
                    ),
                    title: Text("Home")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/files.png'),
                  ),
                  title: Text("Files"),
                ),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      child: Image.asset('assets/icons/story.png'),
                    ),
                    title: Text("Story")),
                BottomNavigationBarItem(
                  icon: Container(
                    height: 50,
                    child: Image.asset('assets/icons/history.png'),
                  ),
                  title: Text("History"),
                ),
              ]),
        ));
  }
}
