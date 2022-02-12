import 'package:flutter/material.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/components/store/donation_item.dart';
import 'package:phar_my/components/store/prize_item.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                titleText("Ödüller"),
                Expanded(child: Container()),
                Column(
                  children: [
                    Row(
                      children: [
                        descText(value.user.worldPoint.toString()),
                        spacerVertical(5),
                        worldIcon(),
                      ],
                    ),
                    const Text(
                      "Dünya Puanı",
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                ),
                spacerVertical(10)
              ]),
            ),
            tabBarView(),
            Expanded(
                child: TabBarView(
              children: [
                ListView.builder(
                  itemCount: value.prizeList.length,
                  itemBuilder: (context, index) =>
                      PrizeItem(value: value.prizeList[index]),
                ),
                ListView.builder(
                  itemCount: value.donationList.length,
                  itemBuilder: (context, index) =>
                      DonationItem(value: value.donationList[index]),
                ),
              ],
              controller: controller,
            ))
          ],
        )),
      ),
    );
  }

  _tab(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Google Sans',
          fontSize: 13,
          color: ThemeColors.mainBlue,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  tabBarView() {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: controller,
            indicatorColor: ThemeColors.mainBlue,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              _tab(
                ('İndirim Kuponları'),
              ),
              _tab(
                ('Bağış Kampanyaları'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
