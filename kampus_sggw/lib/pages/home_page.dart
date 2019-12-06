import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(backgroundColor: Colors.lightGreen,)
        ),
        
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.list),
          iconSize: 50,
        ),
      ],
    ));
  }
}
