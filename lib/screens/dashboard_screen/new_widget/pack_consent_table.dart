



import 'package:cc_portal/controllers/consent_controller.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/status_bullet.dart';
import 'package:cc_portal/reusable_view/test_style.dart';

import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

class PackConsentTable extends StatefulWidget {
  PackConsentTable({super.key, });
 

  @override
  State<PackConsentTable> createState() => _PackConsentTableState();
}

class _PackConsentTableState extends State<PackConsentTable> {
  NewDashBoardController con = Get.find();
  ConsentController consentController = Get.put(ConsentController());
  ConsentController controller = Get.find();

  @override
  void initState() {
    Get.lazyPut(() => ConsentController());
    consentController.fetchPackconsent(StoreManager().customerNumber,
      );
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
      return consentController.isLoading.value
          ? loadingIndicatorView()
          : Padding(
              padding: const EdgeInsets.all(28.0),
              child: SizedBox(
                width: 800,
                child: GenericTableView(
                  list: controller.packConsentTableList,
                  rowChild: ({info}) {
                    print(
                        "tuneConsentTableList=${controller.packConsentTableList}");
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
              templetIdDescriptionPopup();
              print("tappedd");
            },
          style: customTextStyle(
              color: sixdColor,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              height: 2)),
    );
  }

  Future<dynamic> templetIdDescriptionPopup() {
    return Get.dialog(Center(
      child: Material(
        color: transparent,
        child: Container(
          width: popupWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SMText(
                  title: "Display description of Templet id",
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
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


// import 'package:cc_portal/controllers/consent_controller.dart';
// import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cc_portal/Models/generic_table_view_model.dart';
// import 'package:cc_portal/controllers/new_dash_board_controller.dart';
// import 'package:cc_portal/generic_table_view/generic_table_view.dart';
// import 'package:cc_portal/reusable_view/sm_text.dart';
// import 'package:cc_portal/reusable_view/status_bullet.dart';
// import 'package:cc_portal/reusable_view/test_style.dart';
// import 'package:cc_portal/screens/dashboard_screen/dashboard_new_screen.dart';
// import 'package:cc_portal/utilily/colors.dart';
// import 'package:cc_portal/utilily/constants.dart';

// class PackConsentTable extends StatefulWidget {
//   PackConsentTable({super.key});

//   @override
//   State<PackConsentTable> createState() => _PackConsentTableState();
// }

// class _PackConsentTableState extends State<PackConsentTable> {
//   NewDashBoardController con = Get.find();
//   ConsentController controller = Get.put(ConsentController());
//  // late ConsentController consentController;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     Get.delete<ConsentController>();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//        return controller.isLoading.value
//           ? loadingIndicatorView():
//            Padding(
//         padding: const EdgeInsets.all(28.0),
//         child: SizedBox(
//           width: 800,
//           child: GenericTableView(
//             list: controller.packConsentTableList,
//             rowChild: ({info}) {
//               return info?.childType == ChildType.status
//                   ? statusWidget()
//                   : templetId(info);
//             },
//           ),
//         ),
//       );
//     });
//   }

//   RichText templetId(GenericTableViewModel? info) {
//     return RichText(
//       text: TextSpan(
//           text: info?.columnValue ?? '',
//           recognizer: TapGestureRecognizer()
//             ..onTap = () {
//               templetIdDescriptionPopup();
//               print("tappedd");
//             },
//           style: customTextStyle(
//               color: sixdColor,
//               decoration: TextDecoration.underline,
//               decorationThickness: 2,
//               height: 2)),
//     );
//   }

//   Future<dynamic> templetIdDescriptionPopup() {
//     return Get.dialog(Center(
//       child: Material(
//         color: transparent,
//         child: Container(
//           width: popupWidth,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4),
//             color: white,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SMText(
//                   title: "Display description of Templet id",
//                   fontWeight: FontWeight.normal,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ));
//   }

//   Row statusWidget() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         statusBullet("A"),
//       ],
//     );
//   }
// }