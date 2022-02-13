import 'package:flutter/material.dart';
import 'package:phar_my/main.dart';
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
    "Atık Madendir!",
    "Atık Noktanı Bul & Kodu Okut!",
    "Dönüştür, Kazan & Tadını Çıkar"
  ];

  List<String> descs = [
    "Her gün çöpe attığımız onca atığın ne kadar değerli olduğunu biliyor muydun?",
    "Sana en yakın noktadaki atık noktasını bul ve İlaç atıklarının üzerindeki barkodu okut.",
    "PharMy ile atıklarını çöpe atmak yerine geri dönüştürerek birbirinden güzel ödülleri kazan ve çevreyi koru!"
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
                      ? const SizedBox()
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
                                "Hadi Başlayalım",
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

Widget titleText(String title, {Color? color}) {
  return Text(
    title,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: color ?? ThemeColors.readerDark,
      fontFamily: TextFonts.helvatica,
      fontSize: 22,
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
