import 'package:flutter/material.dart';
import 'package:finalproject/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Flutter Final Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: buildRoute(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
