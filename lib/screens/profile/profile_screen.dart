import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phar_my/screens/store/store_screen.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../../components/common/commons.dart';
import '../../theme/style.dart';
import '../onboarding_carousel_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AppNotifier>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: ThemeColors.white,
          appBar: AppBar(
            backgroundColor: ThemeColors.white,
            shadowColor: ThemeColors.white,
            centerTitle: false,
            title: titleText("My Profile"),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                spacer(20),
                Container(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: CachedNetworkImageProvider(
                                    value.user.imgUrl,
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                titleText(value.user.worldPoint.toString()),
                                SizedBox(
                                  width: 5,
                                ),
                                worldIcon()
                              ],
                            ),
                            spacer(5),
                            Text(
                              "World Points",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ThemeColors.black,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                titleText("John Doe"),
                spacer(20),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreScreen(),
                      )),
                  child: sheetItem(Icons.shopping_cart_outlined, "Prizes"),
                ),
                sheetItem(Icons.star_border, "Goals & Achievements"),
                sheetItem(Icons.nature_outlined, "Carbon Footprint"),
                sheetItem(Icons.feedback_outlined, "Contact Us"),
                sheetItem(Icons.info_outline, "About Us"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sheetItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
          height: 52,
          child: Row(
            children: [
              Icon(
                icon,
                color: ThemeColors.mainBlue,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: ThemeColors.gray))),
                height: 52,
                alignment: Alignment.centerLeft,
                child: descText(text),
              )),
            ],
          )),
    );
  }
}
