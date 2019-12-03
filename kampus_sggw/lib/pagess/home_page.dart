import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: MaterialButton(
        onPressed: () => Navigator.pushNamed(context, '/about'),
        child: Text("about"),
      ),
    );
  }
}