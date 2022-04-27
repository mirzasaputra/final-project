import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
// import 'package:simple_permissions/simple_permissions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = "QR Code Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("QR Scan"),
            ),
            body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                Text(
                  data,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                RaisedButton(
                  child: Text("Scan QR"),
                  onPressed: () async {
                    data = await scanner.scan();
                    setState(() {});
                  },
                ),
              ]),
            )));
  }

//   void scanRQ() async {
//     bool result = await SimplePermissions.checkPermission(Permission.Camera);
//     PermissionStatus status = PermissionStatus.notDetermined;

//     if (!result) {
//       status = await SimplePermissions.requestPermission(Permission.Camera);

//       if (result || status == PermissionStatus.authorized) {
//         String scanResult = await scan();

//         setState(() {
//           data = scanResult;
//         });
//       }
//     }
//   }
}
