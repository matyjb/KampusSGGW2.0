import 'package:flutter/material.dart';
import 'package:kampus_sggw/Pages/AboutPage.dart';
import 'package:kampus_sggw/Pages/BuildingsListPage.dart';
import 'package:kampus_sggw/Pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/buildingsList': (context) => BuildingsListPage()
      },
    );
  }
}
