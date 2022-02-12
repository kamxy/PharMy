import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phar_my/models/location_model.dart';
import 'package:phar_my/screens/location/location_detail_screen.dart';

import '../../screens/onboarding_carousel_screen.dart';
import '../../theme/style.dart';
import '../common/commons.dart';

class LocationItem extends StatelessWidget {
  LocationItem({Key? key, required this.location}) : super(key: key);
  Location location;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailScreen(location: location),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: location.name,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(location.imagePath),
                          fit: BoxFit.cover)),
                ),
              ),
              spacer(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      child: titleText(location.name),
                      padding: const EdgeInsets.only(left: 8),
                    ),
                    LinearPercentIndicator(
                        lineHeight: 10.0,
                        percent: location.totalPercent,
                        backgroundColor: ThemeColors.subtitleGrey,
                        barRadius: const Radius.circular(10),
                        progressColor: ThemeColors.mainBlue),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Doluluk Oranı %' +
                            (location.totalPercent * 100)
                                .toString()
                                .split(".")
                                .first,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ThemeColors.subtitleGrey,
                          fontSize: 11,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
