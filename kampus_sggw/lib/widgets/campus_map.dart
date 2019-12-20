
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kampus_sggw/bloc/buildings_bloc.dart';
import 'package:kampus_sggw/models/building.dart';
import 'package:location/location.dart';

class CampusMap extends StatefulWidget {
  @override
  State<CampusMap> createState() => CampusMapState();
}

class CampusMapState extends State<CampusMap> {
  Completer<GoogleMapController> _controller = Completer();
  
  LocationData _startLocation;
  LocationData _currentLocation;
  StreamSubscription<LocationData> _locationSubscription;
  Location _locationService  = new Location();
  bool _permission = false;
  String error;

  static final CameraPosition _sggw = CameraPosition(
    target: LatLng(52.162047, 21.046783),
    zoom: 14.4746,
  );

  initPlatformState() async {
    await _locationService.changeSettings(accuracy: LocationAccuracy.HIGH, interval: 2000);
    
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

          _locationSubscription = _locationService.onLocationChanged().listen((LocationData result) async {
            if(mounted){
              setState(() {
                _currentLocation = result;
              });
            }
          });
        }
      } else {
        bool serviceStatusResult = await _locationService.requestService();
        print("Service status activated after request: $serviceStatusResult");
        if(serviceStatusResult){
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

  Set<Marker> _getMarkers(List<Building> buildings){
    // w tej funkcji musisz zwrocic Set z elementami typu Marker
    // Set to jest zbiór czyli taka Lista ale z unikalnymi elementami
    // by dodac element do zbioru uzyj .add()
    // jak tu:
    // Set<Marker> s = new Set<Marker>();
    // s.add(Marker());
    //       ^^^^^^^^ oczywiście temu Markerowi dodaj pozycje taką jaka jest w buildings (argumencie tej funkcji)
  }

  @override
  Widget build(BuildContext context) {
    final BuildingsBloc buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _sggw,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        markers: _getMarkers(buildingsBloc.state),
      ),
    );
  }

  // Future<void> _goToSGGW() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_sggw));
  // }
}
