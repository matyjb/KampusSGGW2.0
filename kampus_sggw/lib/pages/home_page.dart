import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/widgets/campus_map.dart';
import 'package:kampus_sggw/widgets/droplist.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BuildingsBloc buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    buildingsBloc.add(BuildingsEvent.init);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: Colors.lightGreen,
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: "btn1",
              mini: true,
              onPressed: () {},
              foregroundColor: Colors.green[500],
              backgroundColor: Colors.white,
              child: Icon(
                Icons.my_location,
              ),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.green[500],
            heroTag: "btn2",
            child: Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          CampusMap(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DropList(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/buildingsList');
                },
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
