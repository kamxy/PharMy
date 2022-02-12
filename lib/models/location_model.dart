class Location {
  late String name;
  late double totalPercent;
  late double plasticPercent;
  late double drugPercent;
  late String imagePath;
  late String km;

  Location(
      {required this.name,
      required this.drugPercent,
      required this.imagePath,
      required this.plasticPercent,
      required this.km,
      required this.totalPercent});
}
