import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_subscription_table_controller%20copy.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class HistoryPackSubscriptionTableView extends StatelessWidget {
  HistoryPackSubscriptionTableView({super.key});
  HistorySubscriptionTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        cellHeight: 40,
        headerColumList: con.subscriptionList[0],
        rowList: con.subscriptionList,
        child: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
