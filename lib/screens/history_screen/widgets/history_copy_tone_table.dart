import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_copy_table_controller%20copy%203.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class HistoryCopyToneTableView extends StatelessWidget {
  HistoryCopyToneTableView({super.key});
  HistoryCopyTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        cellHeight: 40,
        headerColumList: con.copyList[0],
        rowList: con.copyList,
        button: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
