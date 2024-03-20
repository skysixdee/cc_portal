import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/copy_tone_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';

import 'custom_alert_dialog.dart';

class CopyDetailTable extends StatelessWidget {
   CopyDetailTable({super.key});
  CopyTonecontroller cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.copyDetailList[0],
        rowList: cont.copyDetailList,
        button: (row, colum) {
            return InkWell(
              onTap: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomAlertDialog(); // Your custom alert dialog widget
                },
              );
              },
              child: Icon(Icons.radio_button_checked)
            );
          

          // InkWell(
          //   onTap: () {
          //     // cont.packDetailList.removeAt(row);
          //      //final offerName = cont.suspendDetailList[row][1].value;
          //     //cont.deletePack(offerName,row);
          //   },
          //   child: Icon(
          //     Icons.clear,
          //   size: 25
          //   ),
          // );
        },
      );
    });
  }
}