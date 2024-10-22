import 'package:flutter/material.dart';
import 'package:cc_portal/enums/font_name.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/reusable_view/sm_text_field/sm_text_field.dart';

Widget userTextField(TextEditingController textEditingController,
    NewDashBoardController controller) {
  //textEditingController.text = StoreManager().customerNumber;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
                  child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
                child: SMText(
              title: welcomeToCustomerCarePortalStr,
              fontSize: 22,
            )),
          ))),
          Expanded(
            child: Center(
              child: SizedBox(
                width: 400,
                child: SmTextField(
                  maxLength: msisdnLength,
                  onlyNumberInput: true,
                  textEditingController: textEditingController,
                  hint: enterMobileNumberStr,
                  onChange: (p0) {
                    controller.msisdn = p0;
                  },
                  onSubmit: (p0) {
                    controller.onSubmitButtonAction(p0);
                  },
                  leadingWidget: SMText(
                    title: countryCode,
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
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
            ),
          ),
          Expanded(child: Center(child: Container())),
        ],
      ),
    ],
  );
}
