import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/app_pageview.dart';
import 'package:phar_my/screens/location/location_detail_screen.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../models/location_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Location? selectedLocation = null;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleText("Merhaba 👋🏻"),
                                descText(value.user.name)
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    descText(value.user.worldPoint.toString()),
                                    spacer(5),
                                    worldIcon()
                                  ],
                                ),
                                const Text(
                                  "Dünya Puanı",
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                            spacerVertical(10),
                            Container(
                              height: 46,
                              width: 46,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(value.user.imgUrl))),
                            )
                          ],
                        ),
                        spacer(20),
                        Text(
                          "Sana En Yakın Atık Noktasını Bul",
                          style: TextStyle(
                              fontSize: 20, color: ThemeColors.readerDark),
                        ),
                        spacer(5),
                        descText("İlaç atıklarını geri dönüştür!")
                      ],
                    ),
                  ),
                  Expanded(
                      child: Stack(
                    children: [
                      map(),
                      Positioned(
                          top: 50,
                          left: 50,
                          child: placeMarker(value.locationList[0])),
                      Positioned(
                          top: 100,
                          right: 50,
                          child: placeMarker(value.locationList[1])),
                      Positioned(
                          top: 200,
                          right: 200,
                          child: placeMarker(value.locationList[2])),
                      selectedLocation != null
                          ? Positioned(
                              bottom: 20,
                              right: 0,
                              child: locationPopUp(selectedLocation!))
                          : SizedBox(),
                    ],
                  )),
                  Container(
                    height: 80,
                    color: ThemeColors.white,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  locationPopUp(Location value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationDetailScreen(
                location: value,
                popup: true,
              ),
            )),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeColors.white,
              boxShadow: boxShadow()),
          child: Row(
            children: [
              Hero(
                tag: value.km,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(value.imagePath))),
                ),
              ),
              spacerVertical(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: titleText(value.name)),
                    spacer(5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: descText(value.km + " km"),
                    ),
                    spacer(5),
                    LinearPercentIndicator(
                      lineHeight: 10.0,
                      percent: value.totalPercent,
                      backgroundColor: ThemeColors.subtitleGrey,
                      barRadius: const Radius.circular(10),
                      progressColor: ThemeColors.mainBlue,
                      alignment: MainAxisAlignment.spaceEvenly,
                    ),
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
                                (value.totalPercent * 100)
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
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              spacerVertical(10),
              InkWell(
                onTap: () => pageController.jumpToPage(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner_sharp,
                      color: ThemeColors.mainBlue,
                      size: 50,
                    ),
                    spacer(10),
                    Container(
                      width: 80,
                      child: Text(
                        'Atık Noktası Seç',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ThemeColors.darkThemeGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              spacerVertical(10)
            ],
          ),
          height: 150,
          width: MediaQuery.of(context).size.width - 32,
        ),
      ),
    );
  }

  placeMarker(Location value) {
    return InkWell(
      onTap: () => setState(() {
        selectedLocation = value;
      }),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 5, color: ThemeColors.mainBlue),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(value.imagePath),
            )),
      ),
    );
  }

  Widget map() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/map.png"), fit: BoxFit.cover)),
    );
  }
}
