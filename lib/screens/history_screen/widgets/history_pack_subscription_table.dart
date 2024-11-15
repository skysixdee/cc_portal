import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/history_controllers/history_subscription_table_controller%20copy.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';

class HistoryPackSubscriptionTableView extends StatelessWidget {
  HistoryPackSubscriptionTableView({super.key});
  HistorySubscriptionTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        headerColumList: con.subscriptionList[0],
        rowList: con.subscriptionList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
