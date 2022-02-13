import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phar_my/models/donation_model.dart';
import 'package:phar_my/models/price_model.dart';
import 'package:phar_my/screens/store/prize_detail_screen.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../theme/style.dart';
import '../common/commons.dart';

class DonationItem extends StatelessWidget {
  DonationItem({Key? key, required this.value, this.detail = false})
      : super(key: key);
  Donation value;
  bool detail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: () {
          Provider.of<AppNotifier>(context, listen: false)
              .setSelectedDonation(value);
          detail
              ? () {}
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrizeDetailScreen(
                        prize: Prize(
                            title: "title",
                            expireDate: "expireDate",
                            wp: 2,
                            imgUrl: "imgUrl"),
                        donation: value),
                  ));
        },
        child: Container(
          height: 250,
          decoration: detail
              ? const BoxDecoration()
              : BoxDecoration(
                  boxShadow: boxShadow(),
                  color: ThemeColors.storeItemColor,
                  borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(value.imgUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
              ),
              spacer(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text(
                  value.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: TextFonts.helvatica,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      'Toplanan Dünya Puanı',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeColors.darkThemeGrey,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Hedeflenen Dünya Puanı',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeColors.darkThemeGrey,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              spacer(5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    worldIcon(),
                    Text(
                      " " + value.current.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeColors.readerDark,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 12,
                      ),
                    ),
                    Expanded(child: Container()),
                    worldIcon(),
                    Text(
                      " " + value.goal.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeColors.readerDark,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
                child: LinearPercentIndicator(
                  lineHeight: 10.0,
                  percent: value.current / value.goal,
                  backgroundColor: ThemeColors.subtitleGrey,
                  barRadius: const Radius.circular(10),
                  progressColor: ThemeColors.mainBlue,
                  alignment: MainAxisAlignment.spaceEvenly,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
