import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/api_calls/buy_tone_api.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

GenericPopup(String message, {String? buttonTitle}) {
  // {String? headerTitle,
  return Get.dialog(_GenericPopupView(
    message: message,
    buttonTitle: buttonTitle,
    //  headerTitle: headerTitle,
  ));
}

class _GenericPopupView extends StatelessWidget {
  const _GenericPopupView({required this.message, this.buttonTitle});
  //, this.headerTitle
  final String message;
  final String? buttonTitle;
  //final String? headerTitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: transparent,
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: popupWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(boxCornerRadius),
            color: white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerView(context),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: SMText(title: message),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    yesButton(context),
                    SizedBox(
                      width: 20,
                    ),
                    cancelButton(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget yesButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SMButton(
        width: 100,
        bgColor: sixdColor,
        title: buttonTitle ?? yesStr,
        textColor: white,
        onTap: () {
         
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget cancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SMButton(
        width: 100,
        bgColor: sixdColor,
        title: buttonTitle ?? cancelStr,
        textColor: white,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  Widget headerView(BuildContext context) {
    return Container(
      color: greyLight,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 40),
          //   SMText(title: headerTitle ?? successCStr),
          closeButton(context),
        ],
      ),
    );
  }

  Widget closeButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        print("On tap");
      },
      child: Container(
        height: 40,
        width: 40,
        child: Icon(Icons.close),
      ),
    );
  }
}
