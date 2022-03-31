class User {
  late String name;
  late int worldPoint;
  late String imgUrl;

  User({required this.name, required this.imgUrl, required this.worldPoint});

  static User fromJson(dynamic json) {
    return User(
        name: json["name"], imgUrl: json["imgUrl"], worldPoint: json["wp"]);
  }
}
