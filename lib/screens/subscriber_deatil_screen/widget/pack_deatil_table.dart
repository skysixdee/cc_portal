import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';
import 'package:sm_admin_portal/screens/copy_screen/widgets/custom_alert_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';
import 'package:sm_admin_portal/screens/copy_screen/widgets/custom_alert_dialog.dart';

class PackDetailTable extends StatelessWidget {
  PackDetailTable({super.key});
  final SubscriberDetailController cont = Get.find();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.packDetailList[0],
        rowList: cont.packDetailList,
        button: (row, colum) {
          return InkWell(
            onTap: () {
              // cont.packDetailList.removeAt(row);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReusableAlertDialog(
                    // isLoading: false,
                    textLine1:
                        '  Are you sure you want to unsubscribe talk to me?',
                    textLine2: "  You can't undo this action.",
                    onYesPressed: () {
                      final offerName = cont.packDetailList[row][1].value;
                      isloading = true;
                      loadingIndicatorView();
                      CircularProgressIndicator();
                      cont.deletePack(offerName, row);
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            child: Icon(Icons.clear, size: 25),
          );
        },

        // onTap: () {
        //     setState(() {
        //       isSelected[row][column] = !isSelected[row][column];
        //       if(isSelected[row][column]==true){
        //       showDialog(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return CustomAlertDialog();
        //         },
        //       );
        //     }});
        //   },
      );
    });
  }
}

Widget loadingIndicatorView() {
  return Container(
    color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
          border: Border.all(
            color: Color.fromARGB(255, 220, 218, 218),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 100,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Loading, please wait...',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';

class PackDetailTable extends StatelessWidget {
  PackDetailTable({super.key});
  SubscriberDetailController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.packDetailList[0],
        rowList: cont.packDetailList,
        button: (row, colum) {
          return InkWell(
            onTap: () {
              cont.packDetailList.removeAt(row);
            },
            child: Icon(Icons.clear, size: 25),
          );
        },
      ); 
    });
  }
}*/
