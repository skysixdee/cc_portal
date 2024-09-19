import 'package:flutter/material.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/status_bullet.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget newUserView(NewDashBoardController cont) {
  return Column(
    children: [
      SizedBox(height: 150),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              boxShadow: smShadow(),
              color: white,
              borderRadius: BorderRadius.circular(8),
              //border: Border.all(color: greyLight),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SMText(
                        title: statusStr,
                        fontWeight: FontWeight.normal,
                      ),
                      SMText(title: " : ", fontWeight: FontWeight.normal),
                      statusBullet("D")
                      // SMText(
                      //     title: inActiveCStr,
                      //     textColor: red,
                      //     fontWeight: FontWeight.normal),
                    ],
                  ),
                  SizedBox(height: 16),
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
                          openGenericPopup(
                            areYouSureYouWantToActivateStr,
                            secondryButtonTitle: cancelCStr,
                            primaryButtonTitle: confirmCStr,
                            primaryAction: () {
                              cont.activateNewUser();
                            },
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ],
  );
}
