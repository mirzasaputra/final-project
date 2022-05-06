// ignore_for_file: deprecated_member_use, avoid_print, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:finalproject/request/get_presence_request.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/component/pages/home/header.dart';
import 'package:finalproject/component/pages/home/status_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late Future<List<DataPresence>> _futureDataPresence;

  Future<void> scanQR(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String qrCodeScanRes;

    try {
      qrCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#f0f0f0', 'Batal', true, ScanMode.QR);
      print(qrCodeScanRes);
    } on PlatformException {
      qrCodeScanRes = "Failed to get platform version.";
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.grey,
            ),
          ),
        );
      },
    );

    final response = await http.post(
      Uri.parse(
          'http://e-presensi-api.000webhostapp.com/public/api/v1/attendance/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
        'X-Requested-With': 'XMLHttpRequest'
      },
      body: jsonEncode(<String, String>{
        'user_id': prefs.getStringList('user')![0],
        'presence_id': id,
      }),
    );

    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF1B5E20),
                      size: 50.0,
                    ),
                    Text(json['message']),
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _futureDataPresence = fetchDataPresence();
                          });
                        },
                        color: Colors.blue.shade900,
                        textColor: Colors.white,
                        child: const Text('Oke')),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width + 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.yellow,
                      size: 50.0,
                    ),
                    Text(json['message']),
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            _futureDataPresence = fetchDataPresence();
                          });
                        },
                        color: Colors.blue.shade900,
                        textColor: Colors.white,
                        child: const Text('Oke')),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _futureDataPresence = fetchDataPresence();

    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Stack(
        children: [
          Column(
            children: [
              HomeHeader(),
              const SizedBox(height: 30),
              FutureBuilder<List<DataPresence>>(
                  future: _futureDataPresence,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].date,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 2.0),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Text(
                                              snapshot.data![index].time,
                                              style: const TextStyle(
                                                  fontSize: 10.0,
                                                  color: Colors.white))),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        snapshot.data![index].description,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      RaisedButton(
                                        onPressed: () {
                                          scanQR(snapshot.data![index].id);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        padding: const EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: <Color>[
                                                Colors.blue,
                                                Colors.blue.shade900,
                                              ],
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10.0)),
                                          ),
                                          child: Container(
                                            width: 150.0,
                                            constraints: const BoxConstraints(
                                                minWidth: 50.0,
                                                minHeight:
                                                    40.0), // min sizes for Material buttons
                                            alignment: Alignment.center,
                                            child: const Text(
                                                'Presensi Sekarang',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width * 0.6) - 40,
            left: 0,
            right: 0,
            child: Center(
              child: StatusBar(),
            ),
          ),
        ],
      ),
    );
  }
}
