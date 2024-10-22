import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/enums/font_name.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';

import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/strings.dart';

openGenericPopup(
  String message, {
  String? headerTitle,
  String? primaryButtonTitle,
  String? secondryButtonTitle,
  Function()? primaryAction,
  Function()? secondryAction,
}) {
  return Get.dialog(
      _GenericPopupView(
        message: message,
        primaryButtonTitle: primaryButtonTitle,
        headerTitle: headerTitle,
        secondryButtonTitle: secondryButtonTitle,
        primaryAction: primaryAction,
        secondryAction: secondryAction,
      ),
      barrierDismissible: false);
}

class _GenericPopupView extends StatelessWidget {
  const _GenericPopupView({
    required this.message,
    this.primaryButtonTitle,
    this.secondryButtonTitle,
    this.headerTitle,
    this.primaryAction,
    this.secondryAction,
  });
  final String message;
  final String? primaryButtonTitle;
  final String? secondryButtonTitle;
  final String? headerTitle;
  final Function()? primaryAction;
  final Function()? secondryAction;
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
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: SMText(
                  title: message,
                  fontWeight: FontWeight.w600,
                ),
              ),
              okButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget okButton(BuildContext context) {
    return secondryButtonTitle != null
        ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Flexible(child: primaryButton(context)),
                SizedBox(width: 20),
                Flexible(child: secondryButton(context))
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: primaryButton(context),
          );
  }

  SMButton primaryButton(BuildContext context) {
    return SMButton(
      width: 200,
      bgColor: sixdColor,
      title: primaryButtonTitle ?? okCStr,
      textColor: white,
      fontSize: 13,
      onTap: () {
        if (primaryAction != null) {
          primaryAction!();
        }
        Navigator.of(context).pop();
      },
    );
  }

  SMButton secondryButton(BuildContext context) {
    return SMButton(
      width: 200,
      bgColor: greyLight,
      fontSize: 13,
      title: secondryButtonTitle ?? cancelStr,
      textColor: black,
      onTap: () {
        if (secondryAction != null) {
          secondryAction!();
        }
        Navigator.of(context).pop();
      },
    );
  }

  Widget headerView(BuildContext context) {
    return Container(
      color: greyLight,
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 40),
          SMText(title: headerTitle ?? successCStr, fontSize: 16),
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
