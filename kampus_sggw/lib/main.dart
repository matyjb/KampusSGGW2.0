import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kampus_sggw/pages/about_page.dart';
import 'package:kampus_sggw/pages/buildings_list_page.dart';
import 'package:kampus_sggw/pages/home_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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