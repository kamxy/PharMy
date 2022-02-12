import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phar_my/components/common/commons.dart';
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
        ),
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
