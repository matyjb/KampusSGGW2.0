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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {},
              foregroundColor: Colors.green[500],
              backgroundColor: Colors.white,
              child: Icon(
                Icons.my_location,
                size: 30,
              ),
            ),
          ),
          Transform.scale(
            scale: 1.3,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: FloatingActionButton(
                backgroundColor: Colors.green[500],
                child: Icon(
                  Icons.search,
                  size: 35,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
