import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/searchbar_bloc.dart';

class DropList extends StatefulWidget {
  @override
  _DropListState createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  void openDropList() {
    setState(() { toggled = !toggled; });
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
        IconButton(onPressed: () {}, icon: Icon(Icons.compare_arrows)),
        IconButton(
          onPressed: () {
            if(BlocProvider.of<SearchbarBloc>(context).state) BlocProvider.of<SearchbarBloc>(context).add(ShowHide.showhide);
            openDropList();
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
