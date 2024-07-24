import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_text_field/sm_text_field.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key, required this.message});
  final String message;
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SMButton(
        width: 200,
        bgColor: sixdColor,
        title: okCStr,
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
          SMText(title: successCStr),
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
