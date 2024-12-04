import 'package:cc_portal/controllers/consent_controller.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/models/generic_table_view_model.dart';
import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/status_bullet.dart';
import 'package:cc_portal/reusable_view/test_style.dart';

import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

class TuneConsentTable extends StatefulWidget {
  TuneConsentTable({super.key, required this.contentId});
  final String contentId;

  @override
  State<TuneConsentTable> createState() => _TuneConsentTableState();
}

class _TuneConsentTableState extends State<TuneConsentTable> {
  NewDashBoardController con = Get.find();
  ConsentController controller = Get.put(ConsentController());
  //ConsentController controller = Get.find();

  @override
  void initState() {
    Get.lazyPut(() => ConsentController());
    controller.fetchToneconsent(
        StoreManager().customerNumber, widget.contentId);
    //consentController = Get.put(ConsentController());
    print("initState controller");
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ConsentController>();
    print("deleteing controller");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? loadingIndicatorView()
          : Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: 800,
                child: GenericTableView(
                  list: controller.tuneConsentTableList,
                  rowChild: ({info}) {
                    print(
                        "tuneConsentTableList=${controller.tuneConsentTableList}");
                    return info?.childType == ChildType.status
                        ? statusWidget()
                        : templetId(info);
                  },
                ),
              ),
            );
    });
  }

  RichText templetId(GenericTableViewModel? info) {
    return RichText(
      text: TextSpan(
          text: info?.columnValue ?? '',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              templetIdDescriptionPopup(info?.columnValue ?? '');
              print("tappedd");
            },
          style: customTextStyle(
              color: sixdColor,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              height: 2)),
    );
  }

  // Future<dynamic> templetIdDescriptionPopup() {
  //   return Get.dialog(Center(
  //     child: Material(
  //       color: transparent,
  //       child: Container(
  //         width: popupWidth,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(4),
  //           color: white,
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SMText(
  //                 title: "Display description of Templet id",
  //                 fontWeight: FontWeight.normal,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   ));
  // }

  Future<dynamic> templetIdDescriptionPopup(String id) {
    controller.fetchTempletMessage(id);
    return Get.dialog(Center(
      child: Material(
          color: transparent,
          child: Obx(
            () {
              return controller.isLoadingTempletMessage.value
                  ? loadingIndicatorView()
                  : Container(
                      width: popupWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: SMText(
                                textAlign: TextAlign.center,
                                title: controller.templetMessage,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          )),
    ));
  }

  Row statusWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        statusBullet("A"),
      ],
    );
  }
}




// Widget build(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.all(28.0),
//     child: SizedBox(
//       width: 800,
//       child: Obx(() {
       
//         if (con.isLoading.value) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         // Once data is loaded, display the table
//         return GenericTableView(
//           list: con.tuneConsentTableList,
//           rowChild: ({info}) {
//             return info?.childType == ChildType.status
//                 ? statusWidget()
//                 : templetId(info);
//           },
//         );
//       }),
//     ),
//   );
// }