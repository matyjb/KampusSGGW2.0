import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final FocusNode node;
  const SearchBar({Key key, this.node}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 40,
        child: TextField(
          focusNode: node,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: "Wyszukaj budynek",
            contentPadding: EdgeInsets.all(10),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ));
  }
}