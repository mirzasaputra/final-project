import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<DataPresence>> fetchDataPresence() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final response = await http.get(
    Uri.parse(
        'http://192.168.100.10:8000/api/v1/presence/${prefs.getStringList('user')![0]}/data'),
    headers: <String, String>{'Content-Type': 'application/json; charset-utf8'},
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed
        .map<DataPresence>((json) => DataPresence.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load data presence');
  }
}

class DataPresence {
  final String id, title, description, time, date;

  DataPresence({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.date,
  });

  factory DataPresence.fromJson(Map<String, dynamic> json) {
    return DataPresence(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      time: json['time'],
      date: json['date'],
    );
  }
}
