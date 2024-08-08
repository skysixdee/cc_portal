import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/api_calls/buy_tone_api.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/reusable_view/generic_popup.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/reusable_view/pop_over.dart';

import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/resuable.dart';

import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/reusable_view/sm_button.dart';

import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/widgets/bottom_button_view.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/widgets/customer_textfield_view.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    final TextEditingController textController = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.isSubmitted.value) {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(Icons.logout),
                  UserInfo(controller),
                  // if (controller.userType == UserType.newUser)
                  //   {
                  newUserBuilder(controller, context),
                  // }else{}
                  SizedBox(height: 30),
                  Expanded(
                    child: userInfoList(controller),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Divider(thickness: 1, color: sixdColor),
                  ),
                  SizedBox(height: 10),
                  bottomButtons(controller, context),
                ],
              ),
            );
          } else {
            return customerTextFieldBuilder(textController, controller);
          }
        }),
      ),
    );
  }

 

  Obx userInfoList(DashboardController controller) {
    return Obx(() {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: controller.subscriptionList.length,
        itemBuilder: (context, index) {
          Offer offer = controller.subscriptionList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  firstColumn(controller, index, context),
                  if (offer.offerStatus != "D") customDivider(),
                  secondColumn(controller, index),
                  if (offer.offerStatus != "D") customDivider(),
                  thirdColumn(controller, index),
                  if (offer.offerStatus != "D") customDivider(),
                  fourthColumn(controller, index),
                ],
              ),
            ],
          );
        },
      );
    });
  }

  SingleChildRenderObjectWidget newUserBuilder(
      DashboardController controller, BuildContext context) {
    return (controller.userType == UserType.newUser)
        ? Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: newSubscriberColumn(controller, 0, context))
        : SizedBox();
  }

  Row UserInfo(DashboardController controller) {
    return Row(
      children: [
        userPic(),
        SizedBox(width: 20),
        userNumber(controller),
      ],
    );
  }
}

Widget customDivider() {
  return Container(
    width: 1,
    color: grey,
    height: 80,
  );
}



Padding userPic() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      child: Icon(
        Icons.person,
        size: 80,
      ),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: black12),
        shape: BoxShape.circle,
        //color: sixdColor,
      ),
    ),
  );
}

Padding userNumber(DashboardController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 25.0),
    child: SMText(
      title: '91+ ${controller.mobileNumber.value}',
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  );
}

Widget newSubscriberColumn(
    DashboardController controller, int index, BuildContext context) {
  final offerStatus = (index >= 0 && index < controller.subscriptionList.length)
      ? controller.subscriptionList[index].offerStatus
      : '';
  // final offerStatus = controller.subscriptionList[index].offerStatus;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SMText(
            title: subscriptionDateStr,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          SMText(title: " : "),
          SMText(
            title: (offerStatus != "A" ||
                    offerStatus != "G" ||
                    offerStatus != "S" ||
                    offerStatus == "D")
                ? "INACTIVE"
                : "ACTIVE",
            fontWeight: FontWeight.normal,
            fontSize: 14,
            textColor: (offerStatus != "A" || offerStatus == "D")
                ? redColor
                : greenColor,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: SMText(
          title: "",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SMButton(
                    onTap: () async {
                      GenericPopup("Do you want to activate");
                      ListSettingModel model = await BuyToneApi(offerStatus);
                    },
                    height: 40,
                    width: 200,
                    bgColor: (offerStatus != "A" ||
                            offerStatus != "S" ||
                            offerStatus != "G" ||
                            offerStatus == "D")
                        ? greenColor
                        : redColor,
                    title: (offerStatus != "A" ||
                            offerStatus != "S" ||
                            offerStatus != "G" ||
                            offerStatus == "D")
                        ? activateStr
                        : DeactivateStr,
                    textColor: white,
                  ),
          ),
        ],
      ),
    ],
  );
}

Column firstColumn(
    DashboardController controller, int index, BuildContext context) {
  String status = controller.subscriptionList[index].offerStatus ?? '';
  return Column(
    children: [
      Row(
        children: [
          SMText(
            title: SubscriptionStatusStr,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          SMText(title: " : "),
          SMText(
            title: status == 'A'
                //  (controller.subscriptionList[index].offerStatus == "A")
                ? "ACTIVE"
                : (status == "G")
                    ? "GRACE"
                    : (status == "S")
                        ? "SUSPEND"
                        : (status == "P")
                            ? "PENDING"
                            : "INACTIVE",
            // (controller.subscriptionList[index].offerStatus == "A" ||
            //         controller.subscriptionList[index].offerStatus == "G" ||
            //         controller.subscriptionList[index].offerStatus == "S" ||
            //         controller.subscriptionList[index].offerStatus != "D")
            //     ? "ACTIVE"
            //     : "INACTIVE",
            fontWeight: FontWeight.normal,
            fontSize: 14,
            textColor: (status == "A") ? greenColor : redColor,
          )
        ],
      ),
      if (status == "D")
        SMText(title: " ")
      else
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SMText(
                title: "${controller.subscriptionList[index].offerName}",
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SMButton(
                onTap: () {
                  String action = (status == "A")
                      ? "ACTIVE"
                      : (status == "G")
                          ? "GRACE"
                          : (status == "S")
                              ? "SUSPEND"
                              : (status == "P")
                                  ? "PENDING"
                                  : "INACTIVE";
                  openBuyTunePopup('', '');
                  // showDialog(
                  //   context: Get.context!,
                  //   builder: (BuildContext context) {
                  //     return ReusableAlertDialogBox(
                  //       textLine1: 'Are you sure you want to $action?',
                  //       onYesPressed: (dialogContext) {
                  //         controller.subscriptionList[index].offerStatus =
                  //             (controller
                  //             .subscriptionList[index].offerStatus ==
                  //         "A")
                  //     ? "ACTIVE"
                  //     : (controller.subscriptionList[index].offerStatus == "G")
                  //         ? "GRACE"
                  //         : (controller.subscriptionList[index].offerStatus ==
                  //                 "S")
                  //             ? "SUSPEND"
                  //             : (controller.subscriptionList[index]
                  //                         .offerStatus ==
                  //                     "P")
                  //                 ? "PENDING"
                  //                 : "INACTIVE";

                  //         controller.subscriptionList.refresh();
                  //         Navigator.of(dialogContext).pop();
                  //         String? currentStatus =
                  //             controller.subscriptionList[index].offerStatus;
                  //         print("Current Status in Button: $currentStatus");
                  //         print("Current Status in Dialog: $currentStatus");
                  //       },
                  //     );
                  //   },
                  // );
                },
                bgColor: (status == "A" ||
                        status == "S" ||
                        status == "G" ||
                        status != "D")
                    ? redColor
                    : greenColor,
                title: (status == "A" || status == "S" || status == "G")
                    ? DeactivateStr
                    : activateStr,
                textColor: white,
              ),
      ),
    ],
  );
}

// Column firstColumn(
//     DashboardController controller, int index, BuildContext context) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           SMText(
//             title: SubscriptionStatusStr,
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//           ),
//           SMText(title: " : "),
//           SMText(
//             title: (controller.subscriptionList[index].offerStatus == "A")
//                 ? "ACTIVE"
//                 : (controller.subscriptionList[index].offerStatus == "G")
//                     ? "GRACE"
//                     : (controller.subscriptionList[index].offerStatus == "S")
//                         ? "SUSPEND"
//                         : (controller.subscriptionList[index].offerStatus ==
//                                 "P")
//                             ? "PENDING"
//                             : "INACTIVE",
//             // (controller.subscriptionList[index].offerStatus == "A" ||
//             //         controller.subscriptionList[index].offerStatus == "G" ||
//             //         controller.subscriptionList[index].offerStatus == "S" ||
//             //         controller.subscriptionList[index].offerStatus != "D")
//             //     ? "ACTIVE"
//             //     : "INACTIVE",
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//             textColor: (controller.subscriptionList[index].offerStatus == "A")
//                 ? greenColor
//                 : redColor,
//           )
//         ],
//       ),
//       if (controller.subscriptionList[index].offerStatus == "D")
//         SMText(title: " ")
//       else
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4.0),
//               child: SMText(
//                 title: "${controller.subscriptionList[index].offerName}",
//                 fontSize: 14,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       Obx(
//         () => controller.isLoading.value
//             ? Center(child: CircularProgressIndicator())
//             : SMButton(
//                 onTap: () {
//                  ReusableAlertDialogBox(
//                   textLine1: ' ',);
//                 },
//                 bgColor: (controller.subscriptionList[index].offerStatus ==
//                             "A" ||
//                         controller.subscriptionList[index].offerStatus == "S" ||
//                         controller.subscriptionList[index].offerStatus == "G" ||
//                         controller.subscriptionList[index].offerStatus != "D")
//                     ? redColor
//                     : greenColor,
//                 title: (controller.subscriptionList[index].offerStatus == "A" ||
//                         controller.subscriptionList[index].offerStatus == "S" ||
//                         controller.subscriptionList[index].offerStatus == "G")
//                     ? DeactivateStr
//                     : activateStr,
//                 textColor: white,
//               ),
//       ),
//     ],
//   );
// }

Widget secondColumn(DashboardController controller, int index) {
  if (controller.subscriptionList[index].offerStatus == "D") {
    return SizedBox();
  }
  return Column(
    children: [
      Row(
        children: [
          SMText(
            title: tempStatusStr,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          SMText(title: " : "),
          Obx(() {
            return SMText(
              title: (controller.settingsList[index].status == "A")
                  ? "ACTIVE"
                  : "SUSPEND",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              textColor: (controller.settingsList[index].status == "A")
                  ? greenColor
                  : redColor,
            );
          })
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: SMText(title: " "),
      ),
      Obx(() {
        return SMButton(
          bgColor: (controller.settingsList[index].status == "A")
              ? redColor
              : greenColor,
          title: (controller.settingsList[index].status == "A")
              ? "Suspend" //resumeServiceStr
              : "Resume", //suspendServiceStr,
          textColor: white,
          onTap: () {
            String action = (controller.settingsList[index].status == "A")
                ? "Resume" //"resumeServiceStr
                : "Suspend"; //suspendServiceStr;
            showDialog(
              context: Get.context!,
              builder: (BuildContext context) {
                return ReusableAlertDialogBox(
                  textLine1: 'Are you sure you want to $action?',
                  onYesPressed: (dialogContext) {
                    controller.settingsList[index].status =
                        (controller.settingsList[index].status == "A")
                            ? "S"
                            : "A";

                    controller.settingsList.refresh();
                    Navigator.of(dialogContext).pop();
                    String? currentStatus =
                        controller.settingsList[index].status;
                    print("Current Status in Button: $currentStatus");
                    print("Current Status in Dialog: $currentStatus");
                  },
                );
              },
            );
          },
        );
      }),
    ],
  );
}

Column thirdColumn(DashboardController controller, int index) {
  if (controller.subscriptionList[index].offerStatus == "D") {
    return Column(
      children: [
        SizedBox.shrink(),
      ],
    );
  }
  return Column(
    children: [
      Row(
        children: [
          SMText(
            title: lastRenewedStr,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: SMText(
          title: "${controller.subscriptionList[index].chargedDate}",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: SMText(title: " "),
      )
    ],
  );
}

Column fourthColumn(DashboardController controller, int index) {
  if (controller.subscriptionList[index].offerStatus == "D") {
    return Column(
      children: [
        SizedBox.shrink(),
      ],
    );
  }
  return Column(
    children: [
      Row(
        children: [
          SMText(
            title: nextRenewalDateStr,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: SMText(
          title: "${controller.subscriptionList[index].expiryDate}",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: SMText(title: " "),
      )
    ],
  );
}



// Column thirdColumn(DashboardController controller, int index) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           SMText(
//             title: lastRenewedStr,
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//           ),
//         ],
//       ),
//       SMText(
//         title: "${controller.subscriptionList[index].chargedDate}",
//         fontWeight: FontWeight.normal,
//         fontSize: 14,
//       ),
//     ],
//   );
// }

// Column fourthColumn(DashboardController controller, int index) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           SMText(
//             title: nextRenewalDateStr,
//             fontWeight: FontWeight.normal,
//             fontSize: 14,
//           ),
//         ],
//       ),SMText(title: "title"),
//       SMText(
//         title: "${controller.subscriptionList[index].expiryDate}",
//         fontWeight: FontWeight.normal,
//         fontSize: 14,
//       )
//     ],
//   );
// }