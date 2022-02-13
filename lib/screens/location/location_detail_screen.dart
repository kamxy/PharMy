import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/models/location_model.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';

class LocationDetailScreen extends StatefulWidget {
  LocationDetailScreen({Key? key, required this.location, this.popup = false})
      : super(key: key);
  Location location;
  bool popup;

  @override
  _LocationDetailScreenState createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: ThemeColors.readerDark,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        shadowColor: ThemeColors.transparan,
        title: titleText("Atık Detayları"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          spacer(20),
          Hero(
            tag: widget.popup ? widget.location.km : widget.location.name,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.location.imagePath),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
          ),
          spacer(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText(widget.location.name),
              spacer(10),
              Text(
                'Aşağıda toplanan atıkların miktarını, çeşitlerini ve \ndoluluk oranını görebilirsiniz.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ThemeColors.darkThemeGrey,
                ),
              ),
            ],
          ),
          spacer(30),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/recycle.png")),
                    ),
                  ),
                  Container(
                    width: 250,
                    child: Column(children: [
                      titleText("Toplam Atık Miktarı"),
                      spacer(10),
                      LinearPercentIndicator(
                        lineHeight: 10.0,
                        percent: widget.location.totalPercent,
                        backgroundColor: ThemeColors.subtitleGrey,
                        barRadius: const Radius.circular(10),
                        progressColor: ThemeColors.mainBlue,
                        alignment: MainAxisAlignment.spaceEvenly,
                      ),
                      spacer(5),
                      Text(
                        'Doluluk Oranı %' +
                            (widget.location.totalPercent * 100)
                                .toString()
                                .split(".")
                                .first,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ThemeColors.darkThemeGrey,
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ],
          ),
          spacer(30),
          containerItem("drug"),
          containerItem("pet"),
          Expanded(child: SizedBox()),
          isClicked
              ? const SizedBox()
              : InkWell(
                  onTap: () async {
                    isClicked = true;
                    setState(() {});
                    showFlushbar("Toplama Talebiniz Alındı", context);
                  },
                  child: Container(
                    height: 54,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                        color: ThemeColors.mainBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Toplama Talebi Gönder",
                      style: TextStyle(
                          color: ThemeColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
          spacer(30)
        ],
      ),
    );
  }

  containerItem(
    String imgPath,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: ThemeColors.gray),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/$imgPath.png"),
              )),
            ),
            spacerVertical(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      imgPath.contains("pet")
                          ? "Ambalaj Atığı Oranı"
                          : "İlaç Atığı Oranı",
                      style: TextStyle(
                          color: ThemeColors.readerDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  spacer(5),
                  LinearPercentIndicator(
                    lineHeight: 10.0,
                    percent: imgPath.contains("pet")
                        ? widget.location.plasticPercent
                        : widget.location.drugPercent,
                    backgroundColor: ThemeColors.subtitleGrey,
                    barRadius: const Radius.circular(10),
                    progressColor: ThemeColors.mainBlue,
                    alignment: MainAxisAlignment.spaceEvenly,
                  ),
                  spacer(5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Doluluk Oranı',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ThemeColors.darkThemeGrey,
                          ),
                        ),
                        Text(
                          "%" +
                              (widget.location.drugPercent * 100)
                                  .toString()
                                  .split(".")
                                  .first
                                  .toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ThemeColors.darkThemeGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
