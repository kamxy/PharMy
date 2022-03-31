import 'package:flutter/material.dart';
import 'package:phar_my/components/appbar/simple_appbar.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/components/deal/deal_item.dart';
import 'package:phar_my/constants/constants.dart';
import 'package:phar_my/models/deal_model.dart';
import 'package:phar_my/screens/home/home_screen.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../screens/app_pageview.dart';
import '../../theme/style.dart';

class DealDetailScreen extends StatefulWidget {
  DealModel dealModel;
  Color? color;
  DealDetailScreen({Key? key, required this.dealModel, this.color})
      : super(key: key);

  @override
  _DealDetailScreenState createState() => _DealDetailScreenState();
}

class _DealDetailScreenState extends State<DealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        appBar: simpleAppbar("Details", context,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ThemeColors.black,
                ))),
        body: Column(
          children: [
            DealItem(
              value: widget.dealModel,
              color: widget.color,
            ),
            space20,
            Padding(
              padding: getHorizontalPadding,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  pageController.jumpToPage(1);
                  currentIndex = 1;
                  Provider.of<AppNotifier>(context, listen: false)
                      .getDirection(value.markers.first.position);
                  getCameraChange(value.markers.first.position);
                  value.carouselController.jumpToPage(0);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: widget.color ?? ThemeColors.mainBlue),
                  child: Center(
                      child: Text(
                    "Go to Location",
                    style: TextStyle(
                        color: ThemeColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            space20,
            Padding(
              padding: getHorizontalPadding,
              child: Text(drugDetail),
            )
          ],
        ),
      ),
    );
  }
}
