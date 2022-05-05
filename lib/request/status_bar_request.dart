import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<StatusBarRequest> fetchStatusBar() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final response = await http.get(
    Uri.parse(
        'http://192.168.100.10:8000/api/v1/presence/${prefs.getStringList('user')![0]}/status'),
    headers: <String, String>{'Content-Type': 'application/json; charset-utf8'},
  );

  if (response.statusCode == 200) {
    return StatusBarRequest.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data status bar');
  }
}

class StatusBarRequest {
  final String onTime, lateLate, notPresent;

  StatusBarRequest({
    required this.onTime,
    required this.lateLate,
    required this.notPresent,
  });

  factory StatusBarRequest.fromJson(Map<String, dynamic> json) {
    return StatusBarRequest(
      onTime: json['on_time'].toString(),
      lateLate: json['late'].toString(),
      notPresent: json['not_present'].toString(),
    );
  }
}
