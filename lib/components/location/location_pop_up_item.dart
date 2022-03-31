import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phar_my/models/location_model.dart';
import 'package:phar_my/screens/scan/scan_screen.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../screens/location/location_detail_screen.dart';
import '../../screens/onboarding_carousel_screen.dart';
import '../../theme/style.dart';
import '../common/commons.dart';

class LocationPopUp extends StatefulWidget {
  Location value;
  LocationPopUp({Key? key, required this.value}) : super(key: key);

  @override
  _LocationPopUpState createState() => _LocationPopUpState();
}

class _LocationPopUpState extends State<LocationPopUp> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationDetailScreen(
                location: widget.value,
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
                tag: widget.value.id,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.value.imagePath))),
                ),
              ),
              spacerVertical(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: titleText(widget.value.name, size: 18)),
                    space10,
                    LinearPercentIndicator(
                      lineHeight: 10.0,
                      percent: (widget.value.totalPercent).toDouble(),
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
                            'Solidity Ratio',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ThemeColors.darkThemeGrey,
                            ),
                          ),
                          Text(
                            "%" +
                                (widget.value.totalPercent * 100)
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
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanScreen(),
                      ));
                  Provider.of<AppNotifier>(context, listen: false).getDirection(
                      LatLng(widget.value.location.latitude,
                          widget.value.location.longitude));
                },
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
                        'Scan Barcode',
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
          height: 120,
          width: MediaQuery.of(context).size.width - 32,
        ),
      ),
    );
  }
}
