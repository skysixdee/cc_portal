import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:cc_portal/controllers/renewal_controller.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';

class RenewalScreen extends StatelessWidget {
  RenewalScreen({super.key});
  RenewalController con = Get.put(RenewalController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextButton(
              onPressed: () {
                con.getToneDetail();
              },
              child: Text("Make api call")),
          Obx(() {
            return CustomTableView(
              cellHeight: 40,
              headerColumList: con.suspendDetailList[0],
              rowList: con.suspendDetailList,
              childWidget: (row, colum) {
                return toggleButton(row, colum ?? 0);
              },
            );
          }),
        ],
      ),
    );
  }

  Widget toggleButton(int row, int colum) {
    return InkWell(
      onTap: () {
        con.suspendDetailList[row].length;
        con.list[row].isSuspend?.value = !con.list[row].isSuspend!.value;
        con.onChangeStatus();
        print("Tapped ${con.list[row].isSuspend?.value}");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.close),
      ),
    );
  }
}
