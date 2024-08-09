import 'package:flutter/material.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget newUserView(NewDashBoardController cont) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SMText(
                title: SubscriptionStatusStr,
                fontWeight: FontWeight.normal,
              ),
              SMText(title: " : ", fontWeight: FontWeight.normal),
              SMText(
                  title: inActiveCStr,
                  textColor: red,
                  fontWeight: FontWeight.normal),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SMButton(
                height: 30,
                bgColor: green,
                title: activateStr,
                textColor: white,
                fontWeight: FontWeight.normal,
                onTap: () {
                  cont.activateNewUser();
                },
              ),
            ],
          )
        ],
      )
    ],
  );
}
