class Place {
  String name;
  double lat;
  double lon;
  int floor;

  Place(this.name, this.lat, this.lon, this.floor);

  factory Place.fromJson(dynamic json) {
    return Place(json['name'], json['place'], json['lon'], json['place']);
  }
}