import 'place.dart';

class Building {
  String id;
  String name;
  double lat;
  double lon;
  List<Place> places;

  Building(this.id, this.name, this.lat, this.lon, this.places);

  factory Building.fromJson(dynamic json) {
    var _placesJson = json['places'] as List;
    List<Place> _places =
        _placesJson.map((place) => Place.fromJson(place)).toList();
    return Building(
        json['id'], json['name'], json['lat'], json['lon'], _places);
  }
}