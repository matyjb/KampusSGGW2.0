import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kampus_sggw/bloc/config_bloc.dart';
import 'package:location/location.dart';

class CampusMap extends StatefulWidget {
  @override
  State<CampusMap> createState() => CampusMapState();
}

class CampusMapState extends State<CampusMap> {
  GoogleMapController _controller;
  bool isMapCreated = false;

  LocationData _startLocation;
  LocationData _currentLocation;
  StreamSubscription<LocationData> _locationSubscription;
  Location _locationService = new Location();
  bool _permission = false;
  String error;

  static final CameraPosition _sggw = CameraPosition(
    target: LatLng(52.162047, 21.046783),
    zoom: 14.4746,
  );

  initPlatformState() async {
    await _locationService.changeSettings(
        accuracy: LocationAccuracy.HIGH, interval: 2000);

    LocationData location;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      bool serviceStatus = await _locationService.serviceEnabled();
      print("Service status: $serviceStatus");
      if (serviceStatus) {
        _permission = await _locationService.requestPermission();
        print("Permission: $_permission");
        if (_permission) {
          location = await _locationService.getLocation();

          _locationSubscription = _locationService
              .onLocationChanged()
              .listen((LocationData result) async {
            if (mounted) {
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if (serviceStatusResult) {
          initPlatformState();
        }
      }
    } on PlatformException catch (e) {
      print(e);
      if (e.code == 'PERMISSION_DENIED') {
        error = e.message;
      } else if (e.code == 'SERVICE_STATUS_ERROR') {
        error = e.message;
      }
      location = null;
    }

    setState(() {
      _startLocation = location;
    });
  }

  @override
  void initState() {
    super.initState();
    this.initPlatformState();
  }

  Set<Marker> renderMarkers() {
    // załadowac tego jsona
    // dla kazdego z miejsc z jsonie dodać marker do Listy
    // użyć toSet() na liście by wyrzucić Set, a nie List
    return [
      Marker(markerId: MarkerId("1"), position: LatLng(52.161914, 21.046616))
    ].toSet();
    // przykładowe ^
  }

  changeMapStyle(ConfigBloc configBloc) {
    switch (configBloc.state) {
      case ThemeType.dark:
        getJsonFile("assets/night_map.json").then(setMapStyle);
        break;
      case ThemeType.light:
        setMapStyle("[]"); // standard map style
        break;
      default:
    }
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    final ConfigBloc configBloc = BlocProvider.of<ConfigBloc>(context);
    if (isMapCreated) changeMapStyle(configBloc);

    return Scaffold(
      body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _sggw,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
            changeMapStyle(configBloc);
            setState(() {
              isMapCreated = true;
            });
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: renderMarkers()),
    );
  }

  // Future<void> _goToSGGW() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_sggw));
  // }
}
