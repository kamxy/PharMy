import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:phar_my/constants/constants.dart';
import 'package:phar_my/constants/storage_keys.dart';
import 'package:phar_my/screens/app_pageview.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/utils/helper.dart';
import 'package:provider/provider.dart';

import '../../models/location_model.dart';
import '../../utils/converter_utils.dart';
import '../../utils/notifiers.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({Key? key}) : super(key: key);

  @override
  _LoadingscreenState createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  bool isOnboarding = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: getLoadingAnimation()),
    );
  }

  initialize() async {
    await getStorageData();
    await getProviderData();

    if (isOnboarding) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingCarouselScreen(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => AppPageview(),
          ),
          (route) => false);
    }
  }

  getProviderData() async {
    await Provider.of<AppNotifier>(context, listen: false).getLocations();
    await Provider.of<AppNotifier>(context, listen: false).getDealItems();
    await Provider.of<AppNotifier>(context, listen: false).getDrugs();
    await Provider.of<AppNotifier>(context, listen: false).getPrizes();
    await Provider.of<AppNotifier>(context, listen: false).getUser();
    await Provider.of<AppNotifier>(context, listen: false).getDonations();
    await Provider.of<AppNotifier>(context, listen: false).setMarkers();
  }

  getStorageData() async {
    await FlutterSecureStorage()
        .read(key: StorageKeys().isOnboardingDone)
        .then((value) {
      if (value == null) {
        FlutterSecureStorage()
            .write(key: StorageKeys().isOnboardingDone, value: "true");
        isOnboarding = true;
      }
    });
  }

  Future<List<Location>> getLocations() async {
    return toModelList(
        Location.fromJson, await FirebaseHelper().getFirebaseData("locations"));
  }

  getLoadingAnimation() {
    return SizedBox(
      child: Lottie.asset(loadingAsset),
      height: 200,
      width: 200,
    );
  }
}
