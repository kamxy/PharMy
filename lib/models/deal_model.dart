class DealModel {
  late String title;
  late String desc;
  late String date;
  late String imgUrl;

  DealModel(
      {required this.date,
      required this.desc,
      required this.title,
      required this.imgUrl});
  static DealModel fromJson(dynamic json) {
    return DealModel(
      title: json['title'],
      desc: json["desc"],
      date: json['date'],
      imgUrl: json['imgUrl'],
    );
  }
}
