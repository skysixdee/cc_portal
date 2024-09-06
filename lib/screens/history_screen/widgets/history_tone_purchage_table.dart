import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_purchase_table_controller%20copy%202.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class HistoryTonePurchaseTableView extends StatelessWidget {
  HistoryTonePurchaseTableView({super.key});
  HistoryPurchaseTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        cellHeight: 40,
        headerColumList: con.purchaseList[0],
        rowList: con.purchaseList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
