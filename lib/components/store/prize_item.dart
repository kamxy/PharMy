import 'package:flutter/material.dart';
import 'package:phar_my/models/price_model.dart';
import 'package:phar_my/screens/store/prize_detail_screen.dart';

import '../../theme/style.dart';
import '../common/commons.dart';

class PrizeItem extends StatelessWidget {
  Prize value;
  bool detail;
  PrizeItem({Key? key, required this.value, this.detail = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: InkWell(
        onTap: () => detail
            ? () {}
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrizeDetailScreen(
                    prize: value,
                  ),
                )),
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
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Ödülü Almak İçin Son Tarih: ' + value.expireDate,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ThemeColors.darkThemeGrey,
                          fontFamily: TextFonts.helvatica,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      value.wp.toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: ThemeColors.darkThemeGrey,
                        fontFamily: TextFonts.helvatica,
                        fontSize: 12,
                      ),
                    ),
                    spacerVertical(5),
                    worldIcon()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
