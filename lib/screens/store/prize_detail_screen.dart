import 'package:flutter/material.dart';
import 'package:phar_my/components/store/donation_item.dart';
import 'package:phar_my/components/store/prize_item.dart';
import 'package:phar_my/models/donation_model.dart';
import 'package:phar_my/models/price_model.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../components/common/commons.dart';
import '../onboarding_carousel_screen.dart';

class PrizeDetailScreen extends StatefulWidget {
  PrizeDetailScreen({Key? key, required this.prize, this.donation})
      : super(key: key);
  Prize prize;
  Donation? donation;
  @override
  _PrizeDetailScreenState createState() => _PrizeDetailScreenState();
}

class _PrizeDetailScreenState extends State<PrizeDetailScreen> {
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
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ThemeColors.readerDark,
                  ),
                ),
                titleText("Detay"),
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
            widget.donation == null
                ? PrizeItem(
                    value: widget.prize,
                    detail: true,
                  )
                : DonationItem(detail: true, value: value.selectedDonation),
            spacer(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  if (widget.donation == null) {
                    Provider.of<AppNotifier>(context, listen: false)
                        .minusWithValue(widget.prize.wp);
                  } else {
                    setState(() {
                      widget.donation!.current++;
                    });
                    Provider.of<AppNotifier>(context, listen: false).minus();
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColors.mainBlue),
                  child: Center(
                      child: Text(
                    "Ödülü Al",
                    style: TextStyle(
                        color: ThemeColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            spacer(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColors.gray),
                child: Center(
                    child: Text(
                  "Websitesine Git",
                  style: TextStyle(
                      color: ThemeColors.mainBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        )),
      ),
    );
  }
}
