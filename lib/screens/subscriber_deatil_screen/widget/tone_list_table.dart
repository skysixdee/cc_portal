import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import '../../../reusable_view/custom_table_view/custom_table_view.dart';

class SettingsListTable extends StatelessWidget {
  SettingsListTable({super.key, required this.isAddPadding});
  final bool isAddPadding;
  TuneListController cont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            isAddPadding ? const EdgeInsets.all(8.0) : const EdgeInsets.all(0),
        child: Padding(
          padding: isAddPadding
              ? const EdgeInsets.all(8.0)
              : const EdgeInsets.all(0),
          child: CustomTableView(
            // cellHeight: 60,
            //  headerHeight: 60,
            // headerBgColor: Colors.grey[300],
            headerColumList: cont.toneList[0],
            rowList: cont.toneList,
            childWidget: (row, colum) {
              return InkWell(
                  onTap: () {
                    // openGenericPopup("are you sure",primaryButtonTitle: confirmCStr,secondryButtonTitle: cancelStr,primaryAction: (){
                    //    Navigator.of(context).pop();
                    // });
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return ReusableAlertDialog(
                    //       // isLoading: false,
                    //       textLine1:
                    //           '  Are you sure you want to unsubscribe talk to me?',
                    //       textLine2: "  You can't undo this action.",
                    //       onYesPressed: () {
                    //         loadingIndicatorView();

                    //         // cont.ToneList.removeAt(row);
                    //         Navigator.of(context).pop();
                    //       },
                    //     );
                    //   },
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SMButton(
                          // title: DeactivateStr,
                          // fontSize: 10,
                          // textColor: white,
                          // bgColor: sixdColor,
                          height: 35,
                          titlePadding: EdgeInsets.symmetric(horizontal: 20),
                          title: DeactivateStr,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          bgColor: sixdColor,
                          textColor: white,
                          onTap: () {
                            openGenericPopup(deactivatePopupMessageStr,
                                primaryButtonTitle: confirmCStr,
                                secondryButtonTitle: cancelCStr,
                                primaryAction: () {
                              cont.toneList.removeAt(row);
                            });
                            // showDialog(R
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return ReusableAlertDialog(
                            //       // isLoading: false,
                            //       textLine1:
                            //           '  Are you sure you want to Deactivate?',
                            //       textLine2: "  You can't undo this action.",
                            //       onYesPressed: () async {
                            //         print("odd");

                            //         //  GenericModal modal = await deleteToneApi(offerStatus);
                            //         loadingIndicatorView();
                            //         cont.toneList.removeAt(row);

                            //         Navigator.of(context).pop();
                            //       },
                            //     );
                            //   },
                            // );
                            print("object");
                          },
                        ),
                        // child: Container(
                        //                 height: 50,
                        //                 width: 120,
                        //                 padding: EdgeInsets.symmetric(horizontal: 8),
                        //                 decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.circular(10),
                        //                   color: sixdColor,
                        //                 ),
                        //                 child: Center(
                        //                   child: SMText(
                        //                     title: submitStr,
                        //                     textColor: white,
                        //                   ),
                        //                 ),
                        //               ),
                        // ),
                        //    child: SMText(title: activateStr),
                      ),
                    ],
                  ));
            },
          ),
        ),
      );
    });
  }
}

Widget loadingIndicatorView() {
  return Container(
    //color: Colors.black.withOpacity(0.5),
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 12, spreadRadius: 4
                //offset: Offset(2, 2),
                ),
          ],
          border: Border.all(
            color: Color.fromARGB(255, 220, 218, 218),
          ),
          borderRadius: BorderRadius.circular(8),
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
                fontWeight: FontWeight.normal,
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
