import 'package:flutter/material.dart';
import 'package:phar_my/models/deal_model.dart';

import '../../theme/style.dart';
import '../common/commons.dart';

class DealItem extends StatelessWidget {
  DealModel value;
  bool detail;
  Color? color;
  DealItem({Key? key, required this.value, this.detail = false, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        height: 230,
        decoration: detail
            ? BoxDecoration(borderRadius: BorderRadius.circular(12))
            : BoxDecoration(
                boxShadow: boxShadow(),
                color: ThemeColors.storeItemColor,
                borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              child: Center(
                child: Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      color: ThemeColors.white,
                      image: DecorationImage(image: NetworkImage(value.imgUrl)),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/deal_bg.png"),
                      fit: BoxFit.cover),
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
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: Row(
                children: [
                  Text(
                    'Expire Date: ' + value.date,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ThemeColors.darkThemeGrey,
                      fontFamily: TextFonts.helvatica,
                      fontSize: 12,
                    ),
                  ),
                  expandedSpace,
                  Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                        color: color ?? ThemeColors.mainBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "Details",
                      style: TextStyle(color: ThemeColors.white),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
