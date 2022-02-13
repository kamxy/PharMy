import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/screens/scan/scan_detail_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:http/http.dart' as http;
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: titleText("Barkod Okut"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shadowColor: ThemeColors.transparan,
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () => scan(),
                child: SizedBox(
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
                                  ? "Okutmak İçin Tıkla"
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
              Expanded(child: Container()),
              checkListItem(),
              spacer(20),
              mainButton(),
              spacer(80)
            ],
          )),
    );
  }

  mainButton() {
    return barcodeData == ''
        ? const SizedBox()
        : InkWell(
            onTap: () async => await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScanDetailScreen(),
                )).then((value) {
              setState(() {
                barcodeData = '';
                Provider.of<AppNotifier>(context, listen: false).addScanBonus();
              });
            }),
            child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width - 32,
                decoration: BoxDecoration(
                    boxShadow: boxShadow(),
                    color: ThemeColors.mainBlue,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'Devam Et',
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
                checkboxItem("Son Kullanım Tarihi Geçmiş", 0),
                checkboxItem("Kullanılmamış", 1),
                checkboxItem("Açılmamış", 2)
              ],
            ),
          );
  }

  Future scan() async {
    try {
      await FlutterBarcodeScanner.scanBarcode(
              "#42CCE9", "Vazgeç", true, ScanMode.BARCODE)
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
