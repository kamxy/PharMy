import 'package:flutter/material.dart';
import 'package:phar_my/components/appbar/simple_appbar.dart';
import 'package:phar_my/components/common/commons.dart';
import 'package:phar_my/components/deal/deal_detail_screen.dart';
import 'package:phar_my/components/deal/deal_item.dart';
import 'package:phar_my/models/deal_model.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/helper.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

class DrugDealScreen extends StatefulWidget {
  const DrugDealScreen({Key? key}) : super(key: key);

  @override
  _DrugDealScreenState createState() => _DrugDealScreenState();
}

class _DrugDealScreenState extends State<DrugDealScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: ThemeColors.white,
        appBar: simpleAppbar(
          "Drugs",
          context,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        descText(value.user.worldPoint.toString()),
                        spacerVertical(5),
                        Icon(
                          Icons.people,
                          color: intEq(selectedIndex, 0)
                              ? ThemeColors.mainBlue
                              : ThemeColors.green,
                          size: 32,
                        )
                      ],
                    ),
                    Text(
                      "Lives Saved",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: customSizeStyle(12),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                tabBarView(),
                Expanded(
                    child: TabBarView(
                  children: [
                    listView(value.medicineDemands),
                    listView(value.medicineAds, color: ThemeColors.green),
                  ],
                  controller: controller,
                )),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.only(bottom: 110, right: 16, left: 16),
                      child:
                          requestButton(onTap: () => showCustomSheet(context)),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listView(List<DealModel> list, {Color? color}) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DealDetailScreen(
                        dealModel: list[index],
                        color: color,
                      ),
                    ));
              },
              child: DealItem(
                value: list[index],
                color: color,
              ),
            ));
  }

  requestButton({required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.code,
              color: ThemeColors.white,
              size: 32,
            ),
            horizontalSpace10,
            titleText(selectedIndex == 0 ? "MAKE A REQUEST" : "DONATE DRUGS",
                color: ThemeColors.white)
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: selectedIndex == 0 ? ThemeColors.mainBlue : ThemeColors.green,
        ),
      ),
    );
  }

  showCustomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, inner) => Container(
              color: ThemeColors.black.withOpacity(0.6),
              child: Container(
                  height: selectedIndex == 0 ? 620 : 540,
                  decoration: BoxDecoration(
                      color: ThemeColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Container(
                              height: 3,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: ThemeColors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textFieldItem("Name Surname"),
                            space10,
                            textFieldItem("Identification Number"),
                            space10,
                            textFieldItem(selectedIndex == 0
                                ? "Requested Drug Name"
                                : "Donated Drug Name"),
                            space10,
                            textFieldItem(selectedIndex == 0
                                ? "Last Date of Drug Request"
                                : "Expiry Date of the Drug"),
                            selectedIndex == 0 ? space10 : SizedBox(),
                            selectedIndex == 0
                                ? textFieldItem("Prescription Number")
                                : SizedBox(),
                            space20,
                            requestButton(onTap: () {
                              Navigator.pop(context);
                              showFlushbar(
                                  "Your request has reached us to be checked.",
                                  context);
                            })
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          );
        });
  }

  textFieldItem(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        space10,
        Container(
          decoration: BoxDecoration(
              color: ThemeColors.gray, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            cursorColor: ThemeColors.mainBlue,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.transparan),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ThemeColors.transparan),
              ),
            ),
          ),
        )
      ],
    );
  }

  _tab(String title, bool isPassive, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'Google Sans',
          fontSize: 13,
          color: isPassive
              ? ThemeColors.darkThemeGrey
              : index != 0
                  ? ThemeColors.green
                  : ThemeColors.mainBlue,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  tabBarView() {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: controller,
            indicatorColor:
                selectedIndex == 0 ? ThemeColors.mainBlue : ThemeColors.green,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: ThemeColors.darkThemeGrey,
            tabs: [
              _tab('Drug Requests', selectedIndex != 0, 0),
              _tab('Donated Drugs', selectedIndex != 1, 1)
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
