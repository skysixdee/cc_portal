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

import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/resuable.dart';

import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/reusable_view/sm_button.dart';

import 'package:sm_admin_portal/router/router_name.dart';

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
                  Icon(Icons.logout),
                  Row(
                    children: [
                      userPic(),
                      SizedBox(width: 20),
                      userNumber(controller),
                    ],
                  ),
                  if (controller.respCode.value == 1) ...[
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: newSubscriberColumn(controller, 0, context)),
                  ],
                  SizedBox(height: 30),
                  Expanded(
                    child: Obx(() {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: controller.subscriptionList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  firstColumn(controller, index, context),
                                  customDivider(),
                                  secondColumn(controller, index),
                                  customDivider(),
                                  thirdColumn(controller, index),
                                  customDivider(),
                                  fourthColumn(controller, index),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Divider(thickness: 1, color: sixdColor),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      tuneListButton(controller, context),
                      SizedBox(width: 8),
                      ActivateNewToneButton(controller, context),
                      SizedBox(width: 8),
                      TransactionHistoryButton(controller, context),
                      SizedBox(width: 7),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: TextField(
                                controller: textController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 10,
                                decoration: InputDecoration(
                                  counterText: '',
                                  hintText:
                                      'Enter mobile number of the subscriber',
                                  hintStyle: TextStyle(
                                    color: black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: GestureDetector(
                              onTap: () => controller.handleSubmit(
                                textController.text,
                              ),
                              child: Container(
                                height: 50,
                                width: 120,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: sixdColor,
                                ),
                                child: Center(
                                  child: SMText(
                                    title: submitStr,
                                    textColor: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      ),
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

Obx tuneListButton(DashboardController controller, BuildContext context) {
  return Obx(
    () {
      bool isClickable = controller.respCode.value == 0;
      return SMButton(
        title: tuneListStr,
        textColor: black,
        addBorder: true,
        borderColor: sixdColor,
        onTap: isClickable
            ? () {
                print("object");
                TuneListController cont = Get.find();
                cont.getToneList(controller.phoneNumber.value);
                context.goNamed(tuneListRoute);
              }
            : null,
      );
    },
  );
}

SMButton ActivateNewToneButton(
    DashboardController controller, BuildContext context) {
  return SMButton(
    title: ActivateNewToneStr,
    textColor: black,
    addBorder: true,
    borderColor: sixdColor,
    onTap: () {
      context.goNamed(activateScreenRoute);
    },
  );
}

SMButton TransactionHistoryButton(
    DashboardController controller, BuildContext context) {
  return SMButton(
    title: transactionHistoryStr,
    textColor: black,
    addBorder: true,
    borderColor: sixdColor,
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
                    onTap: () async{
                       ListSettingModel model =await BuyToneApi(offerStatus);
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
            title: (controller.subscriptionList[index].offerStatus == "A" ||
                    controller.subscriptionList[index].offerStatus == "G" ||
                    controller.subscriptionList[index].offerStatus == "S" ||
                    controller.subscriptionList[index].offerStatus != "D")
                ? "ACTIVE"
                : "INACTIVE",
            fontWeight: FontWeight.normal,
            fontSize: 14,
            textColor: (controller.subscriptionList[index].offerStatus == "A")
                ? greenColor
                : redColor,
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: SMText(
          title: "${controller.subscriptionList[index].offerName}",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SMButton(
                bgColor: (controller.subscriptionList[index].offerStatus ==
                            "A" ||
                        controller.subscriptionList[index].offerStatus == "S" ||
                        controller.subscriptionList[index].offerStatus == "G" ||
                        controller.subscriptionList[index].offerStatus != "D")
                    ? redColor
                    : greenColor,
                title: (controller.subscriptionList[index].offerStatus == "A" ||
                        controller.subscriptionList[index].offerStatus == "S" ||
                        controller.subscriptionList[index].offerStatus == "G")
                    ? DeactivateStr
                    : activateStr,
                textColor: white,
              ),
      ),
    ],
  );
}

Column secondColumn(DashboardController controller, int index) {
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