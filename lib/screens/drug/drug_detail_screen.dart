import 'package:flutter/material.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

class DrugDetailScreen extends StatefulWidget {
  const DrugDetailScreen({Key? key}) : super(key: key);

  @override
  _DrugDetailScreenState createState() => _DrugDetailScreenState();
}

class _DrugDetailScreenState extends State<DrugDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: titleText("İlaç Atığı Miktarları"),
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
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ThemeColors.darkThemeGrey,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 14,
                      ),
                    )),
              ),
            )),
        body: ListView.builder(
          itemCount: value.drugList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.gray),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      value.drugList[index].imgUrl))),
                        ),
                        spacerVertical(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            titleText(value.drugList[index].name,
                                color: ThemeColors.dark),
                            Text(
                              value.drugList[index].count.toString() +
                                  " Adet Toplanmıştır.",
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
      ),
    );
  }
}
