import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/reusable_view/sm_text_field/sm_text_field.dart';

Widget userTextField(TextEditingController textEditingController,
    NewDashBoardController controller) {
  //textEditingController.text = StoreManager().customerNumber;
  return Center(
    child: SizedBox(
      width: 400,
      child: SmTextField(
        textEditingController: textEditingController,
        hint: enterAgentMsisdnStr,
        onChange: (p0) {
          controller.msisdn = p0;
        },
        onSubmit: (p0) {
          controller.onSubmitButtonAction(p0);
        },
        tailingWidget: Padding(
          padding: const EdgeInsets.all(1.0),
          child: SMButton(
            title: submitStr,
            bgColor: sixdColor,
            textColor: white,
            onTap: () {
              controller.onSubmitButtonAction(controller.msisdn);
            },
          ),
        ),
      ),
    ),
  );
}
