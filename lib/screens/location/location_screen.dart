import 'package:flutter/material.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../components/location/location_item.dart';
import '../../theme/style.dart';
import '../onboarding_carousel_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: titleText("Atık Noktaları"),
            shadowColor: ThemeColors.transparan,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sırala",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ThemeColors.readerDark,
                            fontFamily: TextFonts.helvatica,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Pendik",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ThemeColors.readerDark,
                            fontFamily: TextFonts.helvatica,
                            fontSize: 14,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          size: 14,
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Doluluk Oranı",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: ThemeColors.mainBlue,
                            fontFamily: TextFonts.helvatica,
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: ThemeColors.mainBlue,
                          size: 14,
                        ),
                      ],
                    )),
              ),
            )),
        body: ListView.builder(
          itemCount: value.locationList.length,
          itemBuilder: (context, index) {
            return LocationItem(location: value.locationList[index]);
          },
        ),
      ),
    );
  }
}
