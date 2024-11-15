import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/history_controllers/history_renewal_table_controller%20copy%204.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';

class HistoryToneRenewalTableView extends StatelessWidget {
  HistoryToneRenewalTableView({super.key});
  HistoryRenewalTableController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomTableView(
        //cellHeight: 40,
        headerColumList: con.renewalList[0],
        rowList: con.renewalList,
        childWidget: (row, colum) {
          return SMText(
            title: "csfsdf",
          );
        },
      ),
    );
  }
}
