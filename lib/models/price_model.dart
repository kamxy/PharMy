class Prize {
  late String title;
  late String expireDate;
  late int wp;
  late String imgUrl;

  Prize(
      {required this.title,
      required this.expireDate,
      required this.wp,
      required this.imgUrl});

  static Prize fromJson(dynamic json) {
    return Prize(
        title: json["title"],
        expireDate: json["expireDate"],
        wp: json["wp"],
        imgUrl: json["imgUrl"]);
  }
}
