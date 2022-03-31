import 'package:flutter/material.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/drug/drug_deal_screen.dart';
import 'package:phar_my/screens/home/home_screen.dart';
import 'package:phar_my/screens/profile/profile_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/helper.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

PageController pageController = PageController(initialPage: 1);
int currentIndex = 1;

class AppPageview extends StatefulWidget {
  const AppPageview({Key? key}) : super(key: key);

  @override
  _AppPageviewState createState() => _AppPageviewState();
}

class _AppPageviewState extends State<AppPageview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                pageController.jumpToPage(1);
                currentIndex = 1;
                setState(() {});
              },
              backgroundColor: intEq(currentIndex, 1)
                  ? ThemeColors.softBlue
                  : ThemeColors.white,
              child: Icon(
                Icons.location_on_outlined,
                color: intEq(currentIndex, 1)
                    ? ThemeColors.commonBlue
                    : ThemeColors.darkThemeGrey,
                size: 36,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (value) => setState(() {
                currentIndex = value;
              }),
              children: [
                const DrugDealScreen(),
                const HomeScreen(),
                const ProfileScreen()
              ],
            ),
            Align(
              child: Container(
                height: 80,
                child: Padding(
                  padding: getHorizontalPadding,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: getBorder,
                      color: ThemeColors.white,
                    ),
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          bottomNavigationBarItem(
                              Icons.swap_horizontal_circle, 0),
                          expandedSpace,
                          bottomNavigationBarItem(Icons.account_circle, 2)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            )
          ],
        ),
      ),
    );
  }

  BorderRadiusGeometry get getBorder => BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      );

  Widget bottomNavigationBarItem(icon, index) {
    return Expanded(
        child: InkWell(
      onTap: () {
        pageController.jumpToPage(index);
        currentIndex = index;
        setState(() {});
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: intEq(index, currentIndex)
                ? ThemeColors.softBlue
                : ThemeColors.white),
        child: Icon(
          icon,
          size: 32,
          color: intEq(index, currentIndex)
              ? ThemeColors.commonBlue
              : ThemeColors.darkThemeGrey,
        ),
      ),
    ));
  }
}
