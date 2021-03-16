import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/bloc/config_bloc.dart';
import 'package:kampus_sggw/pages/about_page.dart';
import 'package:kampus_sggw/pages/buildings_list_page.dart';
import 'package:kampus_sggw/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuildingsBloc>(
      create: (_) => BuildingsBloc([]),
      child: BlocProvider<ConfigBloc>(
        create: (_) => ConfigBloc(ThemeType.light),
        child: BlocBuilder<ConfigBloc, ThemeType>(
          builder: (_, state) => MaterialApp(
            theme: (state == ThemeType.dark) ? ThemeData.dark().copyWith(accentColor: Colors.green[400]) : ThemeData.light(),
            initialRoute: '/',
            routes: {
              '/': (_) => HomePage(),
              '/about': (_) => AboutPage(),
              '/buildingsList': (_) => BuildingsListPage()
            },
          ),
        ),
      ),
    );
  }
}
