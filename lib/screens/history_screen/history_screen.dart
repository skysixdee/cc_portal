import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:cc_portal/controllers/history_controllers/history_all_table_controller.dart';
import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:cc_portal/controllers/history_controllers/history_copy_table_controller%20copy%203.dart';
import 'package:cc_portal/controllers/history_controllers/history_gift_table_controller%20copy%205.dart';
import 'package:cc_portal/controllers/history_controllers/history_purchase_table_controller%20copy%202.dart';
import 'package:cc_portal/controllers/history_controllers/history_renewal_table_controller%20copy%204.dart';
import 'package:cc_portal/controllers/history_controllers/history_subscription_table_controller%20copy.dart';
import 'package:cc_portal/enums/history_enum.dart';
import 'package:cc_portal/enums/visiblity_type.dart';
import 'package:cc_portal/reusable_view/custom_border_tab_view.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import 'package:cc_portal/reusable_view/custom_visibility_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_all_table_view.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_copy_tone_table.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_gifting_table.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_pack_subscription_table.dart';

import 'package:cc_portal/screens/history_screen/widgets/history_search_view.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_tone_purchage_table.dart';
import 'package:cc_portal/screens/history_screen/widgets/history_tone_renewal_table.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/strings.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  //

  late HistoryController con;
  final double borderWidth = 1;
  final double tabButtonHeight = 40;
  @override
  void initState() {
    con = Get.put(HistoryController());
    Get.lazyPut(() => HistoryAllTableController());
    Get.lazyPut(() => HistoryPurchaseTableController());
    Get.lazyPut(() => HistoryRenewalTableController());
    Get.lazyPut(() => HistoryGiftTableController());
    Get.lazyPut(() => HistoryCopyTableController());
    Get.lazyPut(() => HistorySubscriptionTableController());

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HistoryController>();

    Get.delete<HistoryAllTableController>();
    Get.delete<HistoryPurchaseTableController>();
    Get.delete<HistoryRenewalTableController>();
    Get.delete<HistoryGiftTableController>();
    Get.delete<HistoryCopyTableController>();
    Get.delete<HistorySubscriptionTableController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Width is ===== ${MediaQuery.of(context).size.width}");
    return mainContainer();
  }

  Widget mainContainer() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Flexible(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: searchView(),
            )),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: customTableTabView(),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Obx(() {
                  return CustomVisibiltyView(
                      type: con.visibilityType.value,
                      child: loadRespectiveTableType(con.tableType.value));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loadRespectiveTableType(HistoryTableType type) {
    if (HistoryTableType.all == con.tableType.value) {
      HistoryAllTableController allCont = Get.put(HistoryAllTableController());

      con.tableMenuList.value = allCont.allList[0];
      allCont.makeApiCall();
      return HistoryAllTableView();
    } else if (HistoryTableType.copy == con.tableType.value) {
      HistoryCopyTableController copyCont =
          Get.put(HistoryCopyTableController());
      con.tableMenuList.value = copyCont.copyList[0];
      copyCont.makeApiCall();
      return HistoryCopyToneTableView();
    } else if (HistoryTableType.gift == con.tableType.value) {
      HistoryGiftTableController giftCont =
          Get.put(HistoryGiftTableController());
      con.tableMenuList.value = giftCont.giftList[0];
      giftCont.makeApiCall();
      return HistoryGiftingTableView();
    } else if (HistoryTableType.purchase == con.tableType.value) {
      HistoryPurchaseTableController purchaseCont =
          Get.put(HistoryPurchaseTableController());
      con.tableMenuList.value = purchaseCont.purchaseList[0];
      purchaseCont.makeApiCall();
      return HistoryTonePurchaseTableView();
    } else if (HistoryTableType.renewal == con.tableType.value) {
      HistoryRenewalTableController renewCont =
          Get.put(HistoryRenewalTableController());
      con.tableMenuList.value = renewCont.renewalList[0];
      renewCont.makeApiCall();
      return HistoryToneRenewalTableView();
    } else {
      HistorySubscriptionTableController subscriptionCont =
          Get.put(HistorySubscriptionTableController());
      con.tableMenuList.value = subscriptionCont.subscriptionList[0];
      subscriptionCont.makeApiCall();
      return HistoryPackSubscriptionTableView();
    }
  }

  Widget searchView() {
    return HistorySearchView(
      textController: TextEditingController(),
    );
  }

  Widget customTableTabView() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: tabButtonHeight,
            ),
            Container(
              height: tabButtonHeight,
              decoration: mainContainerDecoration(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //SMText(title: "title"),
                  CustomTableMenuPopupButton(
                      headerColumList: con.tableMenuList),
                ],
              ),
            ),
            const SizedBox(height: 8)
          ],
        ),
        tableTabView(),
      ],
    );
  }

  CustomBorderTabView tableTabView() {
    return CustomBorderTabView(
        tabButtonHeight: tabButtonHeight,
        tabItems: [
          allStr,
          tonePurchaseStr,
          packRenewalStr,
          giftingStr,
          copyToneStr,
          packSubscriptionStr
        ],
        onTap: (index) {
          if (index == 0) {
            con.tableType.value = HistoryTableType.all;
          } else if (index == 1) {
            con.tableType.value = HistoryTableType.purchase;
          } else if (index == 2) {
            con.tableType.value = HistoryTableType.renewal;
          } else if (index == 3) {
            con.tableType.value = HistoryTableType.gift;
          } else if (index == 4) {
            con.tableType.value = HistoryTableType.copy;
          } else {
            con.tableType.value = HistoryTableType.subscrtiption;
          }
        });
  }

  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          color: grey,
          width: borderWidth,
        ),
      ),
    );
  }
}
