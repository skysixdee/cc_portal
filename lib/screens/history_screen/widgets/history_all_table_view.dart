import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/history_controllers/history_all_table_controller.dart';
import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';

class HistoryAllTableView extends StatelessWidget {
  HistoryAllTableView({super.key});
  HistoryAllTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        headerColumList: con.allList[0],
        rowList: con.allList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
