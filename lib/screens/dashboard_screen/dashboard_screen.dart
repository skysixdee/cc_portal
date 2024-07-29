import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/api_calls/buy_tone_api.dart';
import 'package:sm_admin_portal/api_calls/delete_tone_api.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/resuable.dart';
import 'package:sm_admin_portal/reusable_view/reusable_alert_dialog/reusable_alert_dialog_box.dart';

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
                Row(
                  children: [
                    userPic(),
                    SizedBox(width: 20),
                    userNumber(controller),
                  ],
                ),
                SizedBox(height: 30),
                Expanded(child: Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.settingsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          firstColumn(controller, index, context),
                          customDivider(),
                          secondColumn(controller, index),
                          customDivider(),
                          thirdColumn(controller, index),
                          customDivider(),
                          fourthColumn(controller, index),
                        ],
                      );
                    },
                  );
                })),
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
                      border: Border.all(),
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
                                borderRadius: BorderRadius.circular(10),
                                color: sixdColor,
                              ),
                              child: Center(
                                child: SMText(
                                  title: "SUBMIT",
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
    ));
  }

  Widget customDivider() {
    return Container(
      width: 1,
      color: grey,
      height: 80,
    );
  }

  SMButton tuneListButton(
      DashboardController controller, BuildContext context) {
    return SMButton(
      title: tuneListStr,
      textColor: black,
      addBorder: true,
      borderColor: sixdColor,
      onTap: () {
        TuneListController cont = Get.find();
        cont.getToneList(controller.phoneNumber.value);
        context.goNamed(tuneListRoute);
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
          size: 50,
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
              title: (controller.subscriptionList[index].offerStatus == "A")
                  ? "ACTIVE"
                  : "SUSPEND",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              textColor: (controller.subscriptionList[index].offerStatus == "A")
                  ? greenColor
                  : redColor,
            )
          ],
        ),
        SMText(
          title: "${controller.subscriptionList[index].offerName}",
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        SMButton(
          bgColor: (controller.subscriptionList[index].offerStatus == "A")
              ? redColor
              : greenColor,
          title: (controller.subscriptionList[index].offerStatus == "A")
              ? DeactivateStr
              : activateStr,
          textColor: white,
          onTap: () {
            String action =
                (controller.subscriptionList[index].offerStatus == "A")
                    ? "deactivate"
                    : "activate";
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ReusableAlertDialogBox(
                  textLine1: 'Are you sure you want to $action?',
                  onYesPressed: (dialogContext) async {
                    Navigator.of(dialogContext).pop();

                    showDialog(
                      context: dialogContext,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );

                    try {
                      // Perform the API call
                      // if (controller.subscriptionList[index].offerStatus ==
                      //     "A") {
                      //   await deleteToneApi(
                      //       controller.subscriptionList[index].offerStatus);
                      // } else {
                      //   await BuyToneApi(
                      //       controller.subscriptionList[index].offerStatus);
                      // }

                      // // Update the offer status and refresh the list
                      // controller.subscriptionList[index].offerStatus =
                      //     (controller.subscriptionList[index].offerStatus ==
                      //             "A")
                      //         ? "S"
                      //         : "A";
                      // controller.subscriptionList.refresh();
                    } finally {
                      // Close the loading indicator dialog
                      Navigator.of(dialogContext)
                          .pop(); // Dismiss loading dialog
                    }
                  },
                );
              },
            );
          },
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
            SMText(
              title: (controller.settingsList[index].status == "A")
                  ? "ACTIVE"
                  : "SUSPEND",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              textColor: (controller.settingsList[index].status == "A")
                  ? greenColor
                  : redColor,
            )
          ],
        ),
        SMText(title: " "),
        SMButton(
          bgColor: (controller.settingsList[index].status == "A")
              ? redColor
              : greenColor,
          title: (controller.settingsList[index].status == "A")
              ? "Resume" //resumeServiceStr
              : "Suspend", //suspendServiceStr,
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
        ),
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
        SMText(
          title: "${controller.subscriptionList[index].chargedDate}",
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
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
        SMText(
          title: "${controller.subscriptionList[index].expiryDate}",
          fontWeight: FontWeight.normal,
          fontSize: 14,
        )
      ],
    );
  }
}

/*
  Widget buildDetailColumn(BuildContext context, Map<String, dynamic> detail,
      DashboardController controller, int index) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                SMText(
                  title: detail['subscription'],
                ),
                SMText(
                  title: detail['status'],
                  textColor: detail['statusColor'],
                ),
              ],
            ),
            SizedBox(height: 3),
            if (detail['details'] != '')
              SMText(title: detail['details'])
            else
              Text(" "),
            SizedBox(height: 3),
            if (detail['buttonText'] == 'Suspend Service')
              GestureDetector(
                onTap: () {
                  controller.isSubmitted.value = false;
                  detail['status'] = 'SUSPEND';
                  detail['buttonText'] = 'Resume Service';
                  detail['statusColor'] = redColor;
                  controller.isSubmitted.value = true;
                  // deleteToneApi();
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: redColor,
                      ),
                      child: Center(
                        child: SMText(
                          title: detail['buttonText'],
                          textColor: white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (detail['buttonText'] == 'Resume Service')
              GestureDetector(
                onTap: () {
                  controller.isSubmitted.value = false;
                  detail['status'] = 'ACTIVE';
                  detail['buttonText'] = 'Suspend Service';
                  detail['statusColor'] = greenColor;
                  controller.isSubmitted.value = true;
                  // BuyToneApi();
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor,
                      ),
                      child: Center(



                        child: SMText(
                          title: detail['buttonText'],
                          textColor: white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (detail['buttonText'] == 'Deactivate')
              GestureDetector(
                onTap: () async {
                  var response = await deleteToneApi();
                  if (response != null) {
                    controller.isSubmitted.value = false;
                    detail['status'] = 'SUSPEND';
                    detail['buttonText'] = 'Activate';
                    detail['statusColor'] = redColor;
                    controller.isSubmitted.value = true;
                    // deleteToneApi();
                  }
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: redColor,
                      ),
                      child: Center(
                        child: SMText(
                          title: detail['buttonText'],
                          textColor: white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (detail['buttonText'] == 'Activate')
              GestureDetector(
                onTap: () async {
                  var response = await BuyToneApi();
                  if (response != null) {
                    controller.isSubmitted.value = false;
                    detail['status'] = 'ACTIVE';
                    detail['buttonText'] = 'Deactivate';

                    detail['statusColor'] = greenColor;
                    controller.isSubmitted.value = true;
                  }
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor,
                      ),
                      child: Center(
                        child: SMText(
                          title: detail['buttonText'],
                          textColor: white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else if (detail['buttonText'] == 'Delete Service')
              GestureDetector(
                onTap: () async {
                  var response = await deleteToneApi();
                  if (response != null) {
                    controller.isSubmitted.value = false;
                    detail['status'] = 'Delete';
                    detail['statusColor'] = greenColor;
                    controller.isSubmitted.value = true;
                  }
                },
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor,
                      ),
                      child: Center(
                        child: SMText(
                          title: detail['buttonText'],
                          textColor: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        if (detail['subscription'] != 'Next Renewal Date') SizedBox(width: 50),
        if (detail['subscription'] != 'Next Renewal Date')
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 50),
              child: Container(
                height: 80,
                width: 1,
                color: black,
              ),
            ),
          ),
      ],
    );
  }
  */
