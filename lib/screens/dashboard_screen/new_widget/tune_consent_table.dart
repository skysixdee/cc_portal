import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/status_bullet.dart';
import 'package:cc_portal/reusable_view/test_style.dart';
import 'package:cc_portal/screens/dashboard_screen/dashboard_new_screen.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

class TuneConsentTable extends StatelessWidget {
  TuneConsentTable({super.key});
  NewDashBoardController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: SizedBox(
        width: 800,
        child: GenericTableView(
          list: con.tuneConsentTableList,
          rowChild: ({info}) {
            return info?.childType == ChildType.status
                ? statusWidget()
                : templetId(info);
          },
        ),
      ),
    );
  }

  RichText templetId(GenericTableViewModel? info) {
    return RichText(
      text: TextSpan(
          text: info?.columnValue ?? '',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              templetIdDescriptionPopup();
              print("tappedd");
            },
          style: customTextStyle(
              color: sixdColor,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              height: 2)),
    );
  }

  Future<dynamic> templetIdDescriptionPopup() {
    return Get.dialog(Center(
      child: Material(
        color: transparent,
        child: Container(
          width: popupWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SMText(
                  title: "Display description of Templet id",
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  Row statusWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        statusBullet("A"),
      ],
    );
  }
}
