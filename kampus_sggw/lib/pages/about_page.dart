import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        centerTitle: true,
        title: Text("O aplikacji"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Container (
            width: 120,
            height: 120,
            child: Image.asset("assets/logo znak zapytania.png"),
          ),
          
          Container(
            child: Text(
              "Kampus SGGW\nWersja: 1.0\n",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "Aplikacja stworzona przez członków koła naukowego Silver .NET\n",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text(
              "Bartosz Matyjasiak\nWiktor El Attar\nMarta Mazurkiewicz\nAleksander Glebionek\nSzymon Prajzner\nJózef Stocki\nKatarzyna Podkowa",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
          Container (
            width: 160,
            height: 160,
            child: Image.asset("assets/Square_normal.png")
          ),
           Container(
            child: Text(
              "Copyright © Silver .NET Group SGGW 2020",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Text("kontakt@silver.sggw.pl\n",
            style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,),
          ), 
          RaisedButton(
        onPressed: () {},
        child: const Text("Privacy policy", style: TextStyle(fontSize: 20)),
        color: Colors.green[500],
        textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
