import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

import 'package:kampus_sggw/models/building.dart';

enum BuildingsEvent {init}

class BuildingsBloc extends Bloc<BuildingsEvent, List<Building>> {
  @override
  List<Building> get initialState => [];

  @override
  Stream<List<Building>> mapEventToState(BuildingsEvent event) async*{
    if(event == BuildingsEvent.init) {
      var _buildings = await _loadBuildings();
      // print(_buildings);
      yield _buildings;
    }
  }
  
  // List<Building> _buildings;
  // List<Building> get buildings => _buildings;

  // final _buildingController = StreamController<List<Building>>();
  // Stream<List<Building>> get buildingStream => _buildingController.stream;

  Future<String> _loadJson() async {
    return await rootBundle.loadString("assets/budynki_new.json");
  }

  Future<List<Building>> _loadBuildings() async {
    String jsonString = await _loadJson();
    final jsonObj = json.decode(jsonString);
    List<Building> buildings = List<Building>.from(
        jsonObj.map((building) => Building.fromJson(building)));
    return buildings;
  }

  // void dispose() {
  //   _buildingController.close();
  // }
}
