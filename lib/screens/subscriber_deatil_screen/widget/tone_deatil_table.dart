import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  headerColumList: cont.list[0],
                  rowList: cont.list,
                  button: (row, colum) {
                    return InkWell(
                      onTap:(){
                        cont.list.removeAt(row);
                      },
                      child:Icon(
                        Icons.clear,
                        size:25),
                    );
                  },
                );
    });
  }
}
