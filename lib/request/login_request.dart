import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future loginRequest(
    BuildContext context, String username, String password) async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();

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
    Uri.parse('http://e-presensi-api.000webhostapp.com/public/api/v1/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'X-Requested-With': 'XMLHttpRequest'
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  Navigator.pop(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    List<String> dataUser = [
      data['id'].toString(),
      data['name'].toString(),
      data['username'].toString(),
      data['email'].toString(),
      data['phone'].toString(),
    ];

    _prefs.setStringList('user', dataUser);

    Navigator.pop(context);
    Navigator.pushNamed(context, '/main-page');
  } else {
    if (response.statusCode == 422) {
      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['errors']['username'] != null) {
        _showToast(context, data['errors']['username'][0]);
      }

      if (data['errors']['password'] != null) {
        _showToast(context, data['errors']['password'][0]);
      }
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);

      _showToast(context, data['message']);
    }
  }
}

dynamic _showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(SnackBar(
      content: Row(children: [
    const Icon(Icons.close_rounded, color: Colors.red),
    const SizedBox(width: 5.0),
    Text(message),
  ])));
}
