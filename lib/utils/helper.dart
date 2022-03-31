import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/constants.dart';

Future<BitmapDescriptor> getMarkerImage() async {
  return await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(12, 12)), markerImg);
}

class FirebaseHelper {
  Future getFirebaseData(String collectionName) async {
    CollectionReference ref =
        FirebaseFirestore.instance.collection(collectionName);
    var value = await ref.get();
    return value.docs;
  }
}

bool intEq(int first, int second) {
  return first == second;
}
