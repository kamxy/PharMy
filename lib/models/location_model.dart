import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  late int id;
  late String name;
  late double totalPercent;
  late double plasticPercent;
  late double drugPercent;
  late String imagePath;
  late String km;
  late GeoPoint location;

  Location(
      {required this.name,
      required this.drugPercent,
      required this.imagePath,
      required this.plasticPercent,
      required this.km,
      required this.totalPercent,
      required this.location,
      required this.id});

  static Location fromJson(dynamic json) {
    return Location(
        id: json['id'],
        name: json["title"],
        drugPercent: json['drugPer'],
        imagePath: json['imgUrl'],
        plasticPercent: json['petPer'],
        km: "km",
        totalPercent: json['percent'],
        location: json["location"]);
  }
}
