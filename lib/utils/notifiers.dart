import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phar_my/controllers/direction_controller.dart';
import 'package:phar_my/models/deal_model.dart';
import 'package:phar_my/models/donation_model.dart';
import 'package:phar_my/models/drug_model.dart';
import 'package:phar_my/models/location_model.dart';
import 'package:phar_my/utils/helper.dart';

import '../models/direction_model.dart';
import '../models/price_model.dart';
import '../models/user_model.dart';
import 'converter_utils.dart';

class AppNotifier extends ChangeNotifier {
  late List<Location> locationList;
  late List<Drug> drugList;
  late List<Donation> donationList;
  late List<Prize> prizeList;
  late User user;
  late Donation selectedDonation;
  List<DealModel> medicineDemands = [];
  List<DealModel> medicineAds = [];
  Directions? info;
  Set<Marker> markers = {};
  CarouselController carouselController = new CarouselController();

  setSelectedDonation(Donation donation) {
    selectedDonation = donation;
    notifyListeners();
  }

  getDirection(LatLng selectedMarker) async {
    final directions = await DirectionController().getDirection(selectedMarker);
    info = directions;
    notifyListeners();
  }

  scrollFunc(int index) {
    carouselController.animateToPage(index);
    notifyListeners();
  }

  setMarkers() async {
    BitmapDescriptor icon = await getMarkerImage();
    locationList.forEach((element) {
      markers.add(Marker(
        onTap: () {
          scrollFunc(element.id);
        },
        //add first marker
        markerId: MarkerId(element.id.toString()),
        position: LatLng(element.location.latitude,
            element.location.longitude), //position of marker

        icon: icon, //Icon for Marker
      ));
    });
    notifyListeners();
  }

  Future getLocations() async {
    locationList = toModelList(
        Location.fromJson, await FirebaseHelper().getFirebaseData("locations"));
    notifyListeners();
  }

  Future getDealItems() async {
    medicineDemands = toModelList(DealModel.fromJson,
        await FirebaseHelper().getFirebaseData("drugDemands"));
    medicineAds = toModelList(DealModel.fromJson,
        await FirebaseHelper().getFirebaseData("medicineAd"));
    notifyListeners();
  }

  Future getDrugs() async {
    drugList = toModelList(
        Drug.fromJson, await FirebaseHelper().getFirebaseData("drugs"));
    notifyListeners();
  }

  Future getUser() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("users");

    await ref.get().then((value) {
      user = User.fromJson(value.docs.first);
    });

    notifyListeners();
  }

  Future getPrizes() async {
    prizeList = toModelList(
        Prize.fromJson, await FirebaseHelper().getFirebaseData("prizes"));
    notifyListeners();
  }

  Future getDonations() async {
    donationList = toModelList(
        Donation.fromJson, await FirebaseHelper().getFirebaseData("donations"));
    notifyListeners();
  }

  addScanBonus() {
    user.worldPoint += 25;
    notifyListeners();
  }

  minusWithValue(int value) {
    user.worldPoint -= value;
    notifyListeners();
  }

  minus() {
    user.worldPoint--;
    notifyListeners();
  }
}
