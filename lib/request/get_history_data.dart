import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<DataHistory>> fetchDataHistory() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final response = await http.get(
    Uri.parse(
        'http://e-presensi-api.000webhostapp.com/public/api/v1/attendance/${prefs.getStringList('user')![0]}/history'),
    headers: <String, String>{'Content-Type': 'application/json; charset-utf8'},
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed
        .map<DataHistory>((json) => DataHistory.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load data history');
  }
}

class DataHistory {
  final String id, datetime, location;

  DataHistory({
    required this.id,
    required this.datetime,
    required this.location,
  });

  factory DataHistory.fromJson(Map<String, dynamic> json) {
    return DataHistory(
      id: json['id'].toString(),
      datetime: json['datetime'].toString(),
      location: json['location'].toString(),
    );
  }
}
