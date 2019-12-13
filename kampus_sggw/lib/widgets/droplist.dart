import 'package:flutter/material.dart';

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
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.compare_arrows)
        ),
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
