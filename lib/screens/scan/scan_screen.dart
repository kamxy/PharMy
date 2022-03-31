import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/screens/scan/scan_detail_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

import '../app_pageview.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  List<bool> checkList = [false, false, false];
  String barcodeData = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scan();
  }

  @override
  Widget build(BuildContext context) {
    if (barcodeData != '') {
      print("bcc " + barcodeData.split("21").first);
    }
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: titleText("Scan Barcode"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shadowColor: ThemeColors.transparan,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemeColors.black,
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                InkWell(
                  onTap: () => scan(),
                  child: barcodeData != ''
                      ? Container(
                          height: 260,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                  image: NetworkImage(value.drugList
                                      .firstWhere((element) =>
                                          element.barcode.contains(barcodeData))
                                      .imgUrl))),
                        )
                      : SizedBox(
                          height: 360,
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.qr_code_scanner,
                                  size: 320,
                                  color: ThemeColors.darkThemeGrey,
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 40,
                                  width: 160,
                                  color: ThemeColors.white,
                                  child: Center(
                                    child: Text(
                                      barcodeData == ''
                                          ? "Click for Scan"
                                          : barcodeData.split("21").first,
                                      style: TextStyle(
                                          color: ThemeColors.darkThemeGrey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                ),
                space20,
                barcodeData != ''
                    ? titleText(value.drugList
                        .firstWhere(
                            (element) => element.barcode.contains(barcodeData))
                        .name)
                    : SizedBox(),
                Expanded(child: Container()),
                checkListItem(),
                spacer(20),
                mainButton(color: ThemeColors.mainBlue, title: "Save"),
                spacer(20),
                checkList[2]
                    ? mainButton(color: ThemeColors.green, title: "Donate Drug")
                    : SizedBox(
                        height: 44,
                      ),
              ],
            )),
      ),
    );
  }

  mainButton({required String title, required Color color}) {
    return barcodeData == ''
        ? const SizedBox()
        : InkWell(
            onTap: color == ThemeColors.mainBlue
                ? () async => await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScanDetailScreen(),
                        )).then((value) {
                      setState(() {
                        barcodeData = '';
                        Provider.of<AppNotifier>(context, listen: false)
                            .addScanBonus();
                      });
                    })
                : () {
                    Navigator.pop(context);
                    pageController.jumpToPage(0);
                  },
            child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                    boxShadow: boxShadow(),
                    color: color,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ThemeColors.white,
                      fontSize: 22,
                    ),
                  ),
                )),
          );
  }

  checkListItem() {
    return barcodeData == ''
        ? const SizedBox()
        : Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: ThemeColors.softBlue,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                checkboxItem("Past Expiry Date", 0),
                checkboxItem("Used", 1),
                checkboxItem("Unopened", 2)
              ],
            ),
          );
  }

  Future scan() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
              "#42CCE9", "Cancel", true, ScanMode.BARCODE)
          .then((value) {
        setState(() {
          barcodeData = value;
        });
      });
    } catch (e) {}
  }

  checkboxItem(String text, int index) {
    return InkWell(
      onTap: () => setState(() {
        checkList[index] = !checkList[index];
        if (checkList[1] && checkList[2]) {
          if (index == 2) {
            checkList[1] = false;
          } else {
            checkList[2] = false;
          }
        }
      }),
      child: Row(
        children: [
          Icon(
            checkList[index] ? Icons.check_box : Icons.crop_square_outlined,
            color: checkList[index]
                ? ThemeColors.mainBlue
                : ThemeColors.darkThemeGrey,
            size: 28,
          ),
          spacerVertical(10),
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: ThemeColors.darkThemeGrey,
                fontFamily: TextFonts.helvatica,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
