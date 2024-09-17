import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_gift_table_controller%20copy%205.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class HistoryGiftingTableView extends StatelessWidget {
  HistoryGiftingTableView({super.key});
  HistoryGiftTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        headerColumList: con.giftList[0],
        rowList: con.giftList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
