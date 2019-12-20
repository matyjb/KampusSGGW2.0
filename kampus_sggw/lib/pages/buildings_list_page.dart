import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/models/building.dart';

class BuildingsListPage extends StatelessWidget {
  const BuildingsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BuildingsBloc buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Budynków"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(itemCount: buildingsBloc.state.length,
        itemBuilder: (ctx, idx) {
          return ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(buildingsBloc.state[idx].name),
                IconButton(
                  icon: Icon(Icons.my_location),
                  onPressed: () {print("object");},
                )
              ]
            ),
            children: <Widget>[
              Column(
                children: placesList(buildingsBloc.state, idx),
              )
            ],
          );
        }
      )
    );
  }

  List<Widget> placesList(List<Building> buildings ,int idx) {
    List<Widget> placesList = new List<Widget>();
    for (var place in buildings[idx].places) {
      placesList.add(Container(
        margin: EdgeInsets.fromLTRB(25, 2, 0, 2),
        child: Row(
          children: [Text(place.name)]
        ))
      );
    }
    return placesList;
  }
}