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
      name: "Abdi İbrahim",
      km: "0,7",
      drugPercent: 0.82,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fabdi1.png?alt=media&token=761b3cde-7cb3-40c9-aacd-a7d7c09573ea",
      plasticPercent: 0.41,
      totalPercent: 0.83),
  Location(
      name: "İst Marina Avm",
      km: "0,7",
      drugPercent: 0.12,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fistmarina.png?alt=media&token=c14ca815-8a16-46a6-a263-897751ab12f5",
      plasticPercent: 0.76,
      totalPercent: 0.84),
  Location(
      name: "Bim",
      km: "0,7",
      drugPercent: 0.3,
      imagePath:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fbim.png?alt=media&token=672fd317-d5dc-4c3b-8736-4d43579e6fbf",
      plasticPercent: 0.4,
      totalPercent: 0.35),
];

List<Drug> exampleDrugs = [
  Drug(
      count: 3286,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fcoldaway.png?alt=media&token=79c61806-5c09-48c5-9de7-1382827ce162",
      name: "Coldaway Cold"),
  Drug(
      count: 3125,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Frastel.png?alt=media&token=6ebeeea6-f267-4585-b51b-72a8ebcf6176",
      name: "Rastel"),
  Drug(
      count: 1927,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fapranax.png?alt=media&token=ee0d0b78-42dc-4dc0-b2c1-30a58edce5eb",
      name: "Apranax Fort"),
  Drug(
      count: 1282,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fabetyl.png?alt=media&token=861d8b41-c554-4f67-acaa-029cb50feda9",
      name: "Abetly"),
  Drug(
      count: 2382,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fdiafurylfort.png?alt=media&token=e54a2da4-0fba-4d0f-8608-135410a0365c",
      name: "Diafuryl Fort"),
  Drug(
      count: 2382,
      imgUrl:
          "https://firebasestorage.googleapis.com/v0/b/kou-research-project-tracking.appspot.com/o/deneme%2Fcitoles.png?alt=media&token=2b08580b-47c2-4eed-8be9-e9daa5753b78",
      name: "Citioles"),
];

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
