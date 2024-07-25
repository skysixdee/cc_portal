import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';
import '../../../reusable_view/custom_table_view/custom_table_view.dart';

class SettingsListTable extends StatelessWidget {
  SettingsListTable({super.key});
  TuneListController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomTableView(
        cellHeight: 60,
        headerHeight: 60,
        headerBgColor: Colors.grey[300],
        headerColumList: cont.toneList[0],
        rowList: cont.toneList,
        child: (row, colum) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReusableAlertDialog(
                    // isLoading: false,
                    textLine1:
                        '  Are you sure you want to unsubscribe talk to me?',
                    textLine2: "  You can't undo this action.",
                    onYesPressed: () {
                      loadingIndicatorView();

                      // cont.ToneList.removeAt(row);
                      Navigator.of(context).pop();
                    },
                  );
                },
              );
            },
            child: Icon(Icons.clear, size: 25),
          );
        },
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





// class ToneDetailTable extends StatelessWidget {
//   ToneDetailTable({super.key});
//   SubscriberDetailController cont = Get.find();
    
  
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return CustomTableView(
//         cellHeight: 60,
//         headerHeight: 60,
//         headerBgColor: Colors.grey[300],
//         headerColumList: cont.toneDetailList[0],
//         rowList: cont.toneDetailList,
//         button: (row, colum) {
//           return InkWell(
//             onTap: () {

//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return ReusableAlertDialog(textLine1: '  Are you sure you want to unsubscribe talk to me?', textLine2: "  You can't undo this action."); 
//                 },
//               );
//               Tonelist list =
//               cont.toneDetailList[row][colum].object as Tonelist;
//               print("list ======== ${list.albumName}");
//               print("list ======== ${list.contentName}");
//               print("list ======== ${list.status}");
//               print("sky data is ${cont.toneDetailList[row][colum].object}");
//               cont.toneDetailList.removeAt(row);
              
//             },
//             child: Icon(Icons.clear, size: 25),
//           );
//         },
//       );
//     });
//   }
// }




// class ToneDetailTable extends StatelessWidget {
//   ToneDetailTable({super.key});
//   SubscriberDetailController cont = Get.find();
  
//   ReusableAlertDialog object=ReusableAlertDialog(textLine1: ' ', textLine2: ' ');
  
  
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return CustomTableView(
//         cellHeight: 60,
//         headerHeight: 60,
//         headerBgColor: Colors.grey[300],
//         headerColumList: cont.toneDetailList[0],
//         rowList: cont.toneDetailList,
//         button: (row, colum) {
//           return InkWell(
//             onTap: () {

//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return ReusableAlertDialog(textLine1: '  Are you sure you want to unsubscribe talk to me?', textLine2: "  You can't undo this action.",removeRow: true); 
//                 },
//               );
//               Tonelist list =
//                   cont.toneDetailList[row][colum].object as Tonelist;
//               print("list ======== ${list.albumName}");
//               print("list ======== ${list.contentName}");
//               print("list ======== ${list.status}");
//               print("sky data is ${cont.toneDetailList[row][colum].object}");
//               if(object.removeRow==true){
//                 cont.toneDetailList.removeAt(row);
//               }
//               //cont.toneDetailList.removeAt(row);
              
//             },
//             child: Icon(Icons.clear, size: 25),
//           );
//         },
//       );
//     });
//   }
// }
