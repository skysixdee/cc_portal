import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';

import '../../../controllers/subscriber_detail_controler.dart';
import '../../../reusable_view/custom_table_view/custom_table_view.dart';

class ToneDetailTable extends StatelessWidget {
  ToneDetailTable({super.key});
  SubscriberDetailController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.toneDetailList[0],
        rowList: cont.toneDetailList,
        button: (row, colum) {
          return InkWell(
            onTap: () {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReusableAlertDialog(textLine1: '  Are you sure you want to unsubscribe talk to me?', textLine2: "  You can't undo this action.",); 
                },
              );
              Tonelist list =
                  cont.toneDetailList[row][colum].object as Tonelist;
              print("list ======== ${list.albumName}");
              print("list ======== ${list.contentName}");
              print("list ======== ${list.status}");
              print("sky data is ${cont.toneDetailList[row][colum].object}");
              cont.toneDetailList.removeAt(row);
            },
            child: Icon(Icons.clear, size: 25),
          );
        },
      );
    });
  }
}
