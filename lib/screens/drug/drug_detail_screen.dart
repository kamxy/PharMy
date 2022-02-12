import 'package:flutter/material.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';

class DrugDetailScreen extends StatefulWidget {
  const DrugDetailScreen({Key? key}) : super(key: key);

  @override
  _DrugDetailScreenState createState() => _DrugDetailScreenState();
}

class _DrugDetailScreenState extends State<DrugDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: titleText("İlaç Atığı Miktartları"),
          shadowColor: ThemeColors.transparan,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: // Figma Flutter Generator Aada6kasm6aralk2021tarihleriarasndatoplananatkilamiktarlargsterilmitirWidget - TEXT
                      Text(
                    'Aşağıda 6 Kasım - 6 Aralık 2021 tarihleri arasında \ntoplanan atık ilaç miktarları gösterilmiştir',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ThemeColors.darkThemeGrey,
                      fontFamily: TextFonts.helvatica,
                      fontSize: 14,
                    ),
                  )),
            ),
          )),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeColors.mainGray),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: ThemeColors.blue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          titleText("Rastel"),

                          // Figma Flutter Generator 3286adettoplanmtrWidget - TEXT
                          Text(
                            '3286 Adet Toplanmıştır.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ThemeColors.subtitleGrey,
                              fontSize: 11,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}