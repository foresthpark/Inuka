import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inuka_app/providers/HexProvider.dart';

class NfcScanPage extends StatefulWidget {
  NfcScanPage({Key key}) : super(key: key);

  @override
  _NfcScanPageState createState() => _NfcScanPageState();
}

class _NfcScanPageState extends State<NfcScanPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HexProvider>(builder: (context, _hexProvider, child) {
      return Scaffold(
          body: Container(
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
                        child: Image.asset('assets/icons/scan_patient.gif'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please Scan Patient Tag'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
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
      ));
    });
  }
}
