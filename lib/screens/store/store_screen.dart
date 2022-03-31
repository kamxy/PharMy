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
        backgroundColor: ThemeColors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ThemeColors.white,
          title: titleText("Prizes"),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: ThemeColors.black,
              )),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      descText(value.user.worldPoint.toString()),
                      spacerVertical(5),
                      worldIcon(),
                    ],
                  ),
                  Text(
                    "World Points",
                    style: TextStyle(fontSize: 10, color: ThemeColors.black),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
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
        ),
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
                ('Discount Coupons'),
              ),
              _tab(
                ('Donation Campaigns'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
