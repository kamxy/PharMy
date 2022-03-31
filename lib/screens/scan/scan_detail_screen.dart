import 'package:flutter/material.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/screens/store/store_screen.dart';
import 'package:phar_my/theme/style.dart';

class ScanDetailScreen extends StatelessWidget {
  const ScanDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 240,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/onboarding2.png"))),
          ),
          spacer(30),
          // Figma Flutter Generator GeridnmniinteekkrlerWidget - TEXT
          Text(
            'Thank you for your recycling',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ThemeColors.readerDark,
              fontFamily: 'Helvetica Now Display',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          spacer(10),
          Text(
            'Thanks to your contribution to the environment, you have prevented the formation of 0.5 kg of carbon footprint',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ThemeColors.darkThemeGrey,
                fontSize: 14,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          spacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              titleText("25 "),
              worldIcon(),
              titleText(" World Points")
            ],
          ),
          spacer(26),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreScreen(),
                  ));
            },
            child: Container(
              height: 54,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                  color: ThemeColors.mainBlue,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "View Prizes",
                style: TextStyle(
                    color: ThemeColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          spacer(20),
          // Figma Flutter Generator AnasayfayadnWidget - TEXT
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'Back to Homepage',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ThemeColors.mainBlue,
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ],
      )),
    );
  }
}
