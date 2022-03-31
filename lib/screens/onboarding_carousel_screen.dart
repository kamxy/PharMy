import 'package:flutter/material.dart';
import 'package:phar_my/screens/app_pageview.dart';
import 'package:phar_my/theme/style.dart';

import '../components/common/commons.dart';

class OnboardingCarouselScreen extends StatefulWidget {
  OnboardingCarouselScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingCarouselScreen> createState() =>
      _OnboardingCarouselScreenState();
}

class _OnboardingCarouselScreenState extends State<OnboardingCarouselScreen> {
  List<String> titles = [
    "Waste is Mine!",
    "Find The Recycle Point and Scan Code!",
    "Recycle, Share & Enjoy"
  ];

  List<String> descs = [
    "Do you know how valuable all the waste you throw away every day is?",
    "Find the waste point closest to you and scan the barcode on the pharmaceutical waste.",
    "With Pharmate, recycle your waste instead of throwing it away, win beautiful rewards and protect the environment!"
  ];

  int currentPage = 0;
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    PageController controller = new PageController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            itemCount: titles.length,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
                if (value == 2) isDone = true;
              });
            },
            controller: controller,
            itemBuilder: (context, index) => page((index)),
          ),
          Positioned(
              bottom: 32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                    width: MediaQuery.of(context).size.width / 5,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: currentPage == index
                                    ? ThemeColors.mainBlue
                                    : ThemeColors.softBlue),
                          ),
                        ),
                        itemCount: 3,
                      ),
                    ),
                  ),
                  spacer(20),
                  !isDone
                      ? const SizedBox(
                          height: 44,
                        )
                      : InkWell(
                          onTap: () => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppPageview(),
                              ),
                              (route) => false),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeColors.blue,
                            ),
                            child: Center(
                              child: Text(
                                "Let's Go",
                                style: TextStyle(
                                    color: ThemeColors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            height: 44,
                            width: MediaQuery.of(context).size.width - 32,
                          ),
                        )
                ],
              ))
        ],
      ),
    );
  }

  Widget padding() {
    return const Padding(padding: EdgeInsets.symmetric(horizontal: 16));
  }

  goButton(String text) {
    return Container(
      height: 44,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget page(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imgContainer(index.toString()),
        titleText(titles[index]),
        spacer(20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: descText(descs[index])),
        spacer(20)
      ],
    );
  }

  Widget imgContainer(String index) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/onboarding$index.png"))),
    );
  }
}

Widget titleText(String title, {Color? color, double? size}) {
  return Text(
    title,
    textAlign: TextAlign.left,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      color: color ?? ThemeColors.readerDark,
      fontFamily: TextFonts.helvatica,
      fontSize: size ?? 22,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget descText(String desc) {
  return Text(
    desc,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: ThemeColors.readerDark,
      fontFamily: TextFonts.helvatica,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
