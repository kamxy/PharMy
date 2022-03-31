import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phar_my/models/direction_model.dart';

class DirectionController {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  Future<Directions> getDirection(LatLng destination) async {
    LatLng origin = LatLng(40.787822, -73.955618);
    String apiKey = "AIzaSyCHjqg31abbu36t4z60JoVKFswWUf0Fgdo";
    var response = await Dio().get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': apiKey
    });
    return Directions.fromMap(response.data);
  }
}
