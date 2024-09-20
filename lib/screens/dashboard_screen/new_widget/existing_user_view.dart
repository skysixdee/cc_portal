import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_shadow.dart';
import 'package:sm_admin_portal/reusable_view/status_bullet.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';

Widget existingUserView(NewDashBoardController cont) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: cont.offers.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
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
      Flexible(
          child: _cardContainer(_firstColumn1(cont.offers[index], cont),
              customChild: _moreButton(cont.offers[index]))),
      SizedBox(width: 30),
      Flexible(child: _cardContainer(_secondColumn1(cont.offers[index]))),
      SizedBox(width: 30),
      Flexible(child: _cardContainer(_thirdColumn1(cont.offers[index]))),
      SizedBox(width: 30),
    ],
  );
}

Widget verticalDivider() {
  return Container(height: 120, width: 1, color: greyLight);
}

String _dateFormate(String date) {
  if (date.isEmpty) {
    return "";
  }
  DateTime dateTime = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy, HH:mm');

  // HH:mm');
  final String formatted = formatter.format(dateTime);

  return formatted;
}

Widget _firstColumn1(Offer offer, NewDashBoardController cont) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SMText(
                  title: statusStr + " : ",
                  fontWeight: FontWeight.bold,
                ),
                statusBullet(offer.offerStatus ?? ''),
              ],
            ),
            SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SMText(
                  title: packNameStr,
                  fontWeight: FontWeight.bold,
                ),
                SMText(
                  title: offer.offerName ?? '',
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SMText(
                  title: priceStr,
                  fontWeight: FontWeight.bold,
                ),
                SMText(
                  title: (offer.chargedAmount ?? '') +
                      "/" +
                      (offer.chargedValidity ?? ''),
                  fontWeight: FontWeight.normal,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //SizedBox(height: 8),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     SMButton(
            //       title: (offer.offerStatus == "D" || offer.offerStatus == "NA")
            //           ? activateStr
            //           : DeactivateStr,
            //       addBorder: true,
            //       textColor: sixdColor,
            //       addHoverEffect: true,
            //       onHoverColor: sixdColor,
            //       onHoverTitleColor: white,
            //       fontWeight: FontWeight.normal,
            //       onTap: () {
            //         if ((offer.offerStatus == "D" ||
            //             offer.offerStatus == "NA")) {
            //           cont.activateTune();
            //         } else {
            //           cont.deactivateServiceTapped(cont.packName);
            //         }
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    ],
  );
}

Widget _secondColumn1(Offer offer) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: firstActivationStr,
            fontWeight: FontWeight.bold,
          ),
          SMText(
            title: _dateFormate(offer.chargedDate ?? ''),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      SizedBox(height: 12),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: channelStr,
            fontWeight: FontWeight.bold,
          ),
          SMText(
            title: (offer.offerName ?? ''),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    ],
  );
}

Widget _thirdColumn1(Offer offer) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: lastRenewedStr,
            fontWeight: FontWeight.bold,
          ),
          SMText(
            title: _dateFormate(offer.chargedDate ?? ''),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
      SizedBox(height: 12),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: nextRenewalDateStr,
            fontWeight: FontWeight.bold,
          ),
          SMText(
            title: _dateFormate(offer.expiryDate ?? ''),
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    ],
  );
}

Widget _cardContainer(Widget child, {Widget? customChild}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: white,
          boxShadow: smShadow(),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: child,
        )),
      ),
      customChild ?? SizedBox()
    ],
  );
}

Widget _moreButton(Offer offer) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: grey)
          //color: greyLight,
          ),
      height: 30,
      width: 30,
      child: Icon(
        Icons.more_horiz,
        color: grey,
        size: 20,
      ),
    ),
  );
}
