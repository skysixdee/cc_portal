import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/history_controllers/history_copy_table_controller%20copy%203.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';

class HistoryCopyToneTableView extends StatelessWidget {
  HistoryCopyToneTableView({super.key});
  HistoryCopyTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        headerColumList: con.copyList[0],
        rowList: con.copyList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
