import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';

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
