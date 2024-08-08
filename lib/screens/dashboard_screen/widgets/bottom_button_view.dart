import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/dashboard_screen.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget bottomButtons(DashboardController controller, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _tuneListButton(controller, context),
      SizedBox(width: 8),
      _activateNewToneButton(controller, context),
      SizedBox(width: 8),
      _transactionHistoryButton(controller, context),
      SizedBox(width: 7),
    ],
  );
}

Obx _tuneListButton(DashboardController controller, BuildContext context) {
  return Obx(
    () {
      bool isClickable = controller.respCode.value == 0 &&
          controller.subscriptionList
              .every((subscription) => subscription.offerStatus != "D");

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
        bgColor: isClickable ? sixdColor : grey,
      );
    },
  );
}

SMButton _activateNewToneButton(
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

SMButton _transactionHistoryButton(
    DashboardController controller, BuildContext context) {
  return SMButton(
    title: transactionHistoryStr,
    textColor: black,
    addBorder: true,
    bgColor: sixdColor,
    borderColor: sixdColor,
  );
}
