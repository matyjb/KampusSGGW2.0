import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          title: Text("O aplikacji"),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Image.asset(
                "assets/logo.png",
                width: 120,
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Kampus SGGW\nWersja: 1.0",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Aplikacja stworzona przez członków koła naukowego Silver .NET",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "Bartosz Matyjasiak\nWiktor El Attar\nMarta Mazurkiewicz\nAleksander Glebionek\nSzymon Prajzner\nJózef Stocki\nKatarzyna Podkowa",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                "assets/Square_normal.png",
                width: 160,
                height: 160,
              ),
              Text(
                "Copyright © Silver .NET Group SGGW 2020",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "kontakt@silver.sggw.pl",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Privacy policy", style: TextStyle(fontSize: 20)),
                  color: Colors.green[500],
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
