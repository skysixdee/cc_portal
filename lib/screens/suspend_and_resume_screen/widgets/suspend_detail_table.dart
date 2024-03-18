import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sm_admin_portal/controllers/suspend_resume_controller.dart';

import '../../../reusable_view/custom_table_view/custom_table_view.dart';

class SuspendDetailTable extends StatelessWidget {
  SuspendDetailTable({super.key});
  SuspendResumeController cont = Get.find();
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.suspendDetailList[0],
        rowList: cont.suspendDetailList,
        button: (row, colum) {
          return ResponsiveBuilder(builder: (context, sizingInformation) {
            return InkWell(
              onTap: () {
                showPopover(
                  radius: 4,
                  context: context,
                  bodyBuilder: (context) {
                    return DropDownItems1(context, row, colum);
                  },
                  direction: PopoverDirection.bottom,
                  width: 110,
                  arrowHeight: 10,
                  arrowWidth: 20,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 220, 218, 218),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(Icons.arrow_drop_down),
              ),
            );
          });

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

  DropDownItems1(BuildContext context, int? row, int? colum) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              print("row = $row and colum = $colum");

              Navigator.of(context).pop();
              //cont.changeStatus();
              cont.suspendService(row! - 1);
            },
            child: Container(
              width: 110,
              height: 40,
              child: Center(
                child: Text(
                  'Suspend',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              cont.resumeService(row! - 1);
              Navigator.of(context).pop();
              // cont.suspendService();
            },
            child: Container(
              width: 110,
              height: 40,
              child: Center(
                child: Text(
                  'Resume',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
