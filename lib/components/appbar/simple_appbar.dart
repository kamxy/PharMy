import 'package:flutter/material.dart';

import '../../screens/onboarding_carousel_screen.dart';
import '../../theme/style.dart';

AppBar simpleAppbar(String title, context,
    {List<Widget>? actions, Widget? leading}) {
  return AppBar(
      shadowColor: ThemeColors.transparan,
      backgroundColor: ThemeColors.white,
      centerTitle: false,
      leading: leading,
      title: titleText(title),
      actions: actions);
}
