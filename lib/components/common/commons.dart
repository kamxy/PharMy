import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../theme/style.dart';

boxShadow() {
  return [
    BoxShadow(
      color: ThemeColors.shadowColor,
      offset: const Offset(0, 3),
      blurRadius: 6,
    ),
  ];
}

worldIcon() {
  return Container(
    height: 20,
    width: 20,
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/world_icon.png"), fit: BoxFit.cover)),
  );
}

Widget spacer(double height) {
  return SizedBox(
    height: height,
  );
}

Widget spacerVertical(double height) {
  return SizedBox(
    width: height,
  );
}

showFlushbar(String title, context) async {
  return await Flushbar(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    borderRadius: BorderRadius.circular(8),
    maxWidth: MediaQuery.of(context).size.width - 20,
    backgroundColor: ThemeColors.mainBlue,
    isDismissible: false,
    boxShadows: boxShadow(),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.fastOutSlowIn,
    flushbarPosition: FlushbarPosition.BOTTOM,
    margin: EdgeInsets.symmetric(vertical: 8),
    messageText: Row(
      children: [
        Text(
          title,
          style: TextStyle(color: ThemeColors.white),
        ),
      ],
    ),
    duration: Duration(seconds: 2),
  ).show(context);
}

EdgeInsetsGeometry get getHorizontalPadding =>
    EdgeInsets.symmetric(horizontal: 16);

CrossAxisAlignment get crossCenter => CrossAxisAlignment.center;

MainAxisAlignment get mainCenter => MainAxisAlignment.center;

Widget get expandedSpace => Expanded(child: SizedBox());

SizedBox get space => SizedBox(
      height: 62,
    );
SizedBox get space10 => SizedBox(
      height: 10,
    );
SizedBox get space20 => SizedBox(
      height: 20,
    );
SizedBox get horizontalSpace10 => SizedBox(
      width: 10,
    );

SizedBox get horizontalSpace18 => SizedBox(
      width: 18,
    );

DecorationImage assetImage(String asset) {
  return DecorationImage(image: AssetImage(asset));
}

TextStyle customSizeStyle(int size) {
  return TextStyle(
      fontSize: size.toDouble(),
      color: ThemeColors.black,
      fontWeight: FontWeight.w600);
}
