import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

openGenericPopup(
  String message, {
  String? headerTitle,
  String? primaryButtonTitle,
  String? secondryButtonTitle,
  Function()? primaryAction,
  Function()? secondryAction,
}) {
  return Get.dialog(_GenericPopupView(
    message: message,
    primaryButtonTitle: primaryButtonTitle,
    headerTitle: headerTitle,
    secondryButtonTitle: secondryButtonTitle,
    primaryAction: primaryAction,
    secondryAction: secondryAction,
  ));
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
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: SMText(title: message),
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
      bgColor: sixdColor,
      title: secondryButtonTitle ?? cancelStr,
      textColor: white,
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
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 40),
          SMText(title: headerTitle ?? successCStr),
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
