import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/controllers/history_controller.dart';
import 'package:sm_admin_portal/enums/history_enum.dart';
import 'package:sm_admin_portal/reusable_view/custom_border_tab_view.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_all_table_view.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_copy_tone_table.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_gifting_table.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_pack_subscription_table.dart';

import 'package:sm_admin_portal/screens/history_screen/widgets/history_search_view.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_tone_purchage_table.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_tone_renewal_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class HistoryScreen extends StatelessWidget {

  late HistoryController con;
  final double borderWidth = 1;
  final double tabButtonHeight = 45;
  @override
  void initState() {
    con = Get.put(HistoryController());

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HistoryController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchView(),
            const SizedBox(height: 14),
            customTableTabView(),
            Obx(() {
              return loadRespectiveTableType(con.tableType.value);
            })
          ],
        ),
      ),
    );
  }

  Widget loadRespectiveTableType(HistoryTableType type) {
    if (HistoryTableType.all == con.tableType.value) {
      return HistoryAllTableView();
    } else if (HistoryTableType.copy == con.tableType.value) {
      return HistoryCopyToneTableView();
    } else if (HistoryTableType.gift == con.tableType.value) {
      return HistoryGiftingTableView();
    } else if (HistoryTableType.purchase == con.tableType.value) {
      return HistoryTonePurchaseTableView();
    } else if (HistoryTableType.renewal == con.tableType.value) {
      return HistoryToneRenewalTableView();
    } else {
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
                  SMText(title: "title")
                  //CustomTableMenuPopupButton(headerColumList: headerColumList),
                ],
              ),
            )
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
