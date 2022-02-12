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
