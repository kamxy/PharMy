class Donation {
  late String title;
  late int goal;
  late int current;
  late String imgUrl;

  Donation(
      {required this.title,
      required this.current,
      required this.goal,
      required this.imgUrl});

  static Donation fromJson(dynamic json) {
    print(json);
    return Donation(
        title: json["title"],
        current: json["current"],
        goal: json["goal"],
        imgUrl: json["imgUrl"]);
  }
}
