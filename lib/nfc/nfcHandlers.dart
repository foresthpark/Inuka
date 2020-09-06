import 'package:flutter/cupertino.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

Future<String> fetchHex() async {
//     read NFC
  NfcData futureNFCData = await FlutterNfcReader.read().then((response) {
    return response;
  });

  String hex = futureNFCData.id.substring(2, 10);
  print("This is the hex code: $hex");

  return (hex);
}

void stopNfc() {
  FlutterNfcReader.stop().then((response) {
    print(response.status.toString());
  });
}
