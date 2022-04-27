import 'package:finalproject/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/pages/login.dart';

Map<String, WidgetBuilder> buildRoute(BuildContext context) {
  return {
    '/': (context) => const LoginPage(),
    '/main-page': (context) => const MainPage(),
  };
}
