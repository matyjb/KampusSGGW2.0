import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/config_bloc.dart';

class DropList extends StatefulWidget {
  @override
  _DropListState createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  void openDropList() {
    setState(() {
      if (toggled) {
        toggled = !toggled;
      } else {
        toggled = !toggled;
      }
    });
  }

  Column turnedOff() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {
            openDropList();
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  Column turnedOn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {
            openDropList();
          },
          icon: Icon(Icons.settings),
        ),
        Builder(builder: (context) {
          ConfigBloc configBloc = BlocProvider.of<ConfigBloc>(context);
          return IconButton(
            onPressed: () {
              if (configBloc.state == ThemeType.dark) {
                configBloc.add(SetThemeEvent(ThemeType.light));
              } else {
                configBloc.add(SetThemeEvent(ThemeType.dark));
              }
            },
            icon: Icon(Icons.compare_arrows),
          );
        }),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          icon: Icon(Icons.help),
        )
      ],
    );
  }

  bool toggled = false;

  @override
  Widget build(BuildContext context) {
    if (toggled) {
      return turnedOn();
    } else {
      return turnedOff();
    }
  }
}
