import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

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
        image: DecorationImage(image: AssetImage("assets/world_icon.png"))),
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
