import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';

import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

import 'package:sm_admin_portal/utilily/strings.dart';

double _cardHeight = 140;
Widget existingUserView(NewDashBoardController cont) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: cont.offers.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: card(cont, index),
      );
    },
  );
}

Row card(NewDashBoardController cont, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(child: _firstColumn(cont, index)),
      SizedBox(width: 20),
      //if (cont.offers[index].offerStatus != "D") verticalDivider(),
      Expanded(child: _secondColumn(cont, index)),
      SizedBox(width: 20),
      //if (cont.offers[index].offerStatus != "D") verticalDivider(),
      Expanded(
        child: _dateColumn(
            lastRenewedStr, cont.offers[index].chargedDate ?? '', cont, index),
      ),
      SizedBox(width: 20),
      //if (cont.offers[index].offerStatus != "D") verticalDivider(),
      Expanded(
        child: _dateColumn(nextRenewalDateStr,
            cont.offers[index].expiryDate ?? '', cont, index),
      ),
    ],
  );
}

Widget _secondColumn(NewDashBoardController cont, int index) {
  if (cont.offers[index].offerStatus == "D") {
    return SizedBox();
  }
  String status2 = cont.settingsList[index].status ?? '';
  String secondColumnTitle = cont.getSecondColumnStatusName(status2);

  String secondColumnButtonTitle = cont.getSecondColumnButtonName(status2);

  Color secondColumnTitlecolor = status2 == "A" ? green : red;
  Color secondColumnBtnColor = (status2 == "A") ? red : green;
  return CustomOnHover(
    builder: (isHovered) {
      return _column(
        secondColumnTitle,
        titleColor: secondColumnTitlecolor,
        btnColor: isHovered ? sixdColor : white, //secondColumnBtnColor,
        btnName: secondColumnButtonTitle,
        keyTag: tempStatusStr,
        isHovered: isHovered,
        onTap: () {
          print("Status========$status2");
          if (status2 == "A") {
            // cont.suspendTapped();
            openGenericPopup(suspendPopupMessageStr,
                headerTitle: '',
                primaryButtonTitle: confirmCStr,
                secondryButtonTitle: cancelCStr, primaryAction: () {
              cont.suspendTapped();
            });
          } else {
            //  cont.resumeTapped();
            openGenericPopup(resumePopupMessageStr,
                headerTitle: '',
                primaryButtonTitle: confirmCStr,
                secondryButtonTitle: cancelCStr, primaryAction: () {
              cont.resumeTapped();
            }

                // cont.getColumnButtonName(status1)
                );
          }
          print("Tapped 2");
        },
      );
    },
  );
}

Widget _firstColumn(NewDashBoardController cont, int index) {
  String status1 = cont.offers[index].offerStatus ?? '';
  String firstColumnTitle = cont.getColumnStatusName(status1);
  Color firstColumnTitlecolor = status1 == "A" ? green : red;
  Color firstColumnBtnColor = (status1 == "D" || status1 == "NA") ? green : red;
  String firstColumnButtonTitle = cont.getColumnButtonName(status1);
  return CustomOnHover(
    builder: (isHovered) {
      return _column(
        firstColumnTitle,
        titleColor: firstColumnTitlecolor,
        offerName: "$packNameStr ${cont.offers[index].offerName}",
        btnColor: isHovered ? sixdColor : white,
        btnName: firstColumnButtonTitle,
        isHovered: isHovered,
        onTap: () {
          if (status1 == "A") {
            //cont.deactivateTapped(cont.offers[index].offerName ?? '');
            openGenericPopup(deactivatePopupMessageStr,
                headerTitle: '',
                primaryButtonTitle: confirmCStr,
                secondryButtonTitle: cancelCStr, primaryAction: () {
              cont.deactivateTapped(cont.offers[index].offerName ?? '');
            }

                // cont.getColumnButtonName(status1)
                );
            //openGenericPopup(cont.offers[index].offerName ?? '');
          } else {
            //cont.activateTapped();
            openGenericPopup(activatePopupMessageStr,
                headerTitle: '',
                primaryButtonTitle: confirmCStr,
                secondryButtonTitle: cancelCStr, primaryAction: () {
              cont.activateTapped();
            }
                // cont.getColumnButtonName(status1)
                );
          }
        },
      );
    },
  );
}

Widget verticalDivider() {
  return Container(height: 120, width: 1, color: greyLight);
}

Widget _column(String title,
    {Color titleColor = red,
    Color btnColor = red,
    String? offerName,
    String btnName = '',
    String? keyTag,
    bool isHovered = false,
    Function()? onTap}) {
  return Container(
    height: _cardHeight,
    decoration: BoxDecoration(
        boxShadow: smShadow(),
        color: white,
        //border: Border.all(color: greyLight),
        borderRadius: BorderRadius.circular(8)),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SMText(
                title: keyTag ?? SubscriptionStatusStr,
                fontWeight: FontWeight.normal,
              ),
              SMText(title: " : ", fontWeight: FontWeight.normal),
              SMText(
                  title: title,
                  textColor: titleColor,
                  fontWeight: FontWeight.normal),
            ],
          ),
          offerName != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child:
                      SMText(title: offerName, fontWeight: FontWeight.normal),
                )
              : SMText(
                  title: "",
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SMButton(
                height: 30,
                bgColor: btnColor,
                addBorder: true,
                borderColor: grey,
                title: btnName,
                textColor: isHovered ? white : titleColor,
                fontWeight: FontWeight.normal,
                onTap: () {
                  print("object");
                  if (onTap != null) {
                    onTap();
                  }
                },
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget _dateColumn(String title, String value, cont, index) {
  if (cont.offers[index].offerStatus == "D") {
    return SizedBox();
  }
  return Container(
    height: _cardHeight,
    decoration: BoxDecoration(
        boxShadow: smShadow(),
        color: white,
        //border: Border.all(color: greyLight),
        borderRadius: BorderRadius.circular(8)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: title,
            fontWeight: FontWeight.normal,
          ),
          SMText(
            title: _dateFormate(value, cont, index),
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 10,
          ),
          //SMText(title: " ")
        ],
      ),
    ),
  );
}

String _dateFormate(String date, cont, index) {
  if (date.isEmpty) {
    return "";
  }
  DateTime dateTime = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  // HH:mm');
  final String formatted = formatter.format(dateTime);
  print("SKY ==== $formatted");
  return formatted;
}
