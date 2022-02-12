import 'package:flutter/material.dart';
import 'package:phar_my/models/donation_model.dart';
import 'package:phar_my/models/drug_model.dart';
import 'package:phar_my/models/location_model.dart';

import '../models/price_model.dart';
import '../models/user_model.dart';

class AppNotifier extends ChangeNotifier {
  late List<Location> locationList;
  late List<Drug> drugList;
  late List<Donation> donationList;
  late List<Prize> prizeList;
  late User user;
  late Donation selectedDonation;

  setSelectedDonation(Donation donation) {
    selectedDonation = donation;
    notifyListeners();
  }

  setUser(User value) {
    user = value;
  }

  setDrugList(List<Drug> value) {
    drugList = value;
  }

  setLocationList(List<Location> value) {
    locationList = value;
  }

  setPrizeList(List<Prize> value) {
    prizeList = value;
  }

  setDonationList(List<Donation> value) {
    donationList = value;
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
