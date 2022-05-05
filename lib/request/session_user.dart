import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

Future<UserData> fetchUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return UserData.fromJson(prefs.getStringList('user'));
}

class UserData {
  final String id, name, username, email, phone;

  const UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
  });

  factory UserData.fromJson(List<String>? data) {
    if (data != null) {
      return UserData(
        id: data[0],
        name: data[1],
        username: data[2],
        email: data[3],
        phone: data[4],
      );
    }

    return const UserData(id: '', name: '', username: '', email: '', phone: '');
  }
}
