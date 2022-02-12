import 'package:flutter/material.dart';
import 'package:phar_my/models/example_data.dart';
import 'package:phar_my/screens/drug/drug_detail_screen.dart';
import 'package:phar_my/screens/home/home_screen.dart';
import 'package:phar_my/screens/location/location_screen.dart';
import 'package:phar_my/screens/scan/scan_screen.dart';
import 'package:phar_my/screens/store/store_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

class AppPageview extends StatefulWidget {
  const AppPageview({Key? key}) : super(key: key);

  @override
  _AppPageviewState createState() => _AppPageviewState();
}

PageController pageController = PageController();
int currentIndex = 0;

class _AppPageviewState extends State<AppPageview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppNotifier>(context, listen: false)
        .setDonationList(exampleDonation);
    Provider.of<AppNotifier>(context, listen: false).setDrugList(exampleDrugs);
    Provider.of<AppNotifier>(context, listen: false).setUser(expampleUser);
    Provider.of<AppNotifier>(context, listen: false).setPrizeList(examplePrize);
    Provider.of<AppNotifier>(context, listen: false)
        .setLocationList(exampleLocations);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (value) => setState(() {
              currentIndex = value;
            }),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const HomeScreen(),
              const DrugDetailScreen(),
              const ScanScreen(),
              const LocationScreen(),
              const StoreScreen()
            ],
          ),
          Align(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ThemeColors.white,
              ),
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomNavigationBarItem(Icons.home, 0),
                    bottomNavigationBarItem(Icons.medical_services_rounded, 1),
                    bottomNavigationBarItem(Icons.qr_code_scanner_rounded, 2),
                    bottomNavigationBarItem(Icons.location_on_outlined, 3),
                    bottomNavigationBarItem(Icons.shopping_cart_outlined, 4)
                  ],
                ),
              ),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }

  Widget bottomNavigationBarItem(icon, index) {
    return Expanded(
        child: InkWell(
      onTap: () {
        pageController.jumpToPage(index);
        currentIndex = index;
        setState(() {});
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: index == currentIndex
                ? ThemeColors.softBlue
                : ThemeColors.white),
        child: Icon(
          icon,
          color: index == currentIndex
              ? ThemeColors.commonBlue
              : ThemeColors.darkThemeGrey,
        ),
      ),
    ));
  }
}
