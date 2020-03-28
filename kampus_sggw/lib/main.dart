import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/pages/about_page.dart';
import 'package:kampus_sggw/pages/buildings_list_page.dart';
import 'package:kampus_sggw/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuildingsBloc>(
      create: (ctx) => BuildingsBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/about': (context) => AboutPage(),
          '/buildingsList': (context) => BuildingsListPage()
        },
      ),
    );
  }
}
