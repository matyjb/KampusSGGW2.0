import 'package:flutter/material.dart';
import 'package:kampus_sggw/AboutPage.dart';
import 'package:kampus_sggw/BuildingsListPage.dart';
import 'package:kampus_sggw/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("appbar"),
        ),
        body: HomePage(),
      ),
      routes: {
        '/about': (context) => AboutPage(),
        '/buildingsList': (context) => BuildingsListPage()
      },
    );
  }
}
