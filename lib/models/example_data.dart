import 'package:phar_my/models/donation_model.dart';
import 'package:phar_my/models/drug_model.dart';
import 'package:phar_my/models/location_model.dart';
import 'package:phar_my/models/price_model.dart';
import 'package:phar_my/models/user_model.dart';

List<Location> exampleLocations = [
  Location(
      name: "Selvi Eczanesi",
      km: "1,9",
      drugPercent: 0.2,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fselvie.png?alt=media&token=74f5fa31-282e-4262-8b38-d758bf46629c",
      plasticPercent: 0.1,
      totalPercent: 0.15),
  Location(
      name: "İş Bankası",
      km: "1,2",
      drugPercent: 0.6,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fis_bankasi.png?alt=media&token=cc0c9443-3fa9-4b93-8228-59ac35557417",
      plasticPercent: 0.6,
      totalPercent: 0.6),
  Location(
      name: "Bim",
      km: "0,7",
      drugPercent: 0.3,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fbim.png?alt=media&token=672fd317-d5dc-4c3b-8736-4d43579e6fbf",
      plasticPercent: 0.4,
      totalPercent: 0.35),
];

List<Drug> exampleDrugs = [];

List<Prize> examplePrize = [
  Prize(
      title: "Supradyn Vitaminlerinde %5 İndirim Kodu",
      expireDate: "12/05/22",
      wp: 50,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fsupradyn.png?alt=media&token=05761790-a8cc-49de-b81d-6232dcf60ba8"),
  Prize(
      title: "Eczacıbaşı Dynavit %10 İndirim Kodu",
      expireDate: "31/11/22",
      wp: 100,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fdynavit.png?alt=media&token=77fb54eb-a09a-4bb5-96f7-b6ed55815f50"),
];

List<Donation> exampleDonation = [
  Donation(
      title: "Anne Çocuk Eğitim Vakfı Kampanyası",
      current: 817,
      goal: 1000,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Facev.png?alt=media&token=ad105b66-b8c6-442f-af78-b678f5abe15e"),
  Donation(
      title: "Doğa Derneği Bağış Kampanyası",
      current: 249,
      goal: 1000,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fdoga.png?alt=media&token=5a6bc87e-4133-4ec4-9c29-58a60c6209ae"),
];

User expampleUser = User(
    name: "Gülişah Sanem Şen",
    imgUrl:
        "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fpp_url.png?alt=media&token=eeb678e5-d1ca-4de4-b86b-2689043edc2d",
    worldPoint: 157);
