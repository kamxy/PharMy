class Drug {
  late String name;
  late String imgUrl;
  late int count;
  late String barcode;

  Drug(
      {required this.count,
      required this.imgUrl,
      required this.name,
      required this.barcode});

  static Drug fromJson(dynamic json) {
    return Drug(
      name: json['title'],
      count: 1,
      imgUrl: json['imgUrl'],
      barcode: json['barcode'],
    );
  }
}
