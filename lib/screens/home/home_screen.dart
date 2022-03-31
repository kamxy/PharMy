import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/constants/constants.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../components/location/location_pop_up_item.dart';
import '../../models/location_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

late CameraPosition cameraPosition;

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  Location? selectedLocation = null;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        appBar: appbar,
        body: Stack(
          children: [googleMap(value), carouselSlider(value)],
        ),
      ),
    );
  }

  AppBar get appbar => AppBar(
        backgroundColor: ThemeColors.white,
        centerTitle: false,
        toolbarHeight: kToolbarHeight - 10,
        title: Container(
          height: 34,
          width: 140,
          decoration: BoxDecoration(image: assetImage(appLogo)),
        ),
      );

  googleMap(AppNotifier value) {
    return GoogleMap(
      mapToolbarEnabled: false,
      buildingsEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      tiltGesturesEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: initialCamPosition,
      compassEnabled: false,
      markers: value.markers,
      polylines: {
        if (value.info != null)
          getPolyLine(
            value.info!.polylinePoints
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList(),
          )
      },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  carouselSlider(AppNotifier value) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 110),
        child: SizedBox(
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            carouselController: value.carouselController,
            items: value.locationList
                .map((item) => LocationPopUp(value: item))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 0.85,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              height: 160,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                getCameraChange(value.markers.elementAt(index).position);
                setState(() {
                  gotoLocation();
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Polyline getPolyLine(List<LatLng> latLang) {
    return Polyline(
        polylineId: const PolylineId('overview_polyline'),
        color: Colors.red,
        width: 6,
        points: latLang);
  }

  gotoLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  sheetItem(IconData icon, String text) {
    return Container(
        height: 52,
        child: Row(
          children: [
            Icon(
              icon,
              color: ThemeColors.mainBlue,
            ),
            horizontalSpace10,
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: ThemeColors.gray))),
              height: 52,
              alignment: Alignment.centerLeft,
              child: descText(text),
            )),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

getCameraChange(LatLng target) {
  cameraPosition =
      CameraPosition(bearing: bearing, target: target, tilt: tilt, zoom: zoom);
}
