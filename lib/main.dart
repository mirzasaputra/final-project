import 'package:flutter/material.dart';
import 'package:finalproject/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(const MyApp());

List<String>? user;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  user = prefs.getStringList("user");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: user == null ? '/' : '/main-page',
      title: 'Flutter Final Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: buildRoute(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
