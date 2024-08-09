import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

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
    children: [
      _firstColumn(cont, index),
      verticalDivider(),
      _secondColumn(cont, index),
      verticalDivider(),
      _dateColumn(lastRenewedStr, cont.offers[index].chargedDate ?? ''),
      verticalDivider(),
      _dateColumn(nextRenewalDateStr, cont.offers[index].expiryDate ?? ''),
    ],
  );
}

Column _secondColumn(NewDashBoardController cont, int index) {
  String status2 = cont.settingsList[index].status ?? '';
  String secondColumnTitle = cont.getSecondColumnStatusName(status2);
  String secondColumnButtonTitle = cont.getSecondColumnButtonName(status2);
  Color secondColumnTitlecolor = status2 == "A" ? green : red;
  Color secondColumnBtnColor = (status2 == "A") ? red : green;
  return _column(
    secondColumnTitle,
    titleColor: secondColumnTitlecolor,
    btnColor: secondColumnBtnColor,
    btnName: secondColumnButtonTitle,
    keyTag: tempStatusStr,
    onTap: () {
      print("Tapped 2");
    },
  );
}

Column _firstColumn(NewDashBoardController cont, int index) {
  String status1 = cont.offers[index].offerStatus ?? '';
  String firstColumnTitle = cont.getColumnStatusName(status1);
  Color firstColumnTitlecolor = status1 == "A" ? green : red;
  Color firstColumnBtnColor = (status1 == "D" || status1 == "NA") ? green : red;
  String firstColumnButtonTitle = cont.getColumnButtonName(status1);
  return _column(
    firstColumnTitle,
    titleColor: firstColumnTitlecolor,
    offerName: cont.offers[index].offerName,
    btnColor: firstColumnBtnColor,
    btnName: firstColumnButtonTitle,
    onTap: () {
      print("Tapped 2");
    },
  );
}

Widget verticalDivider() {
  return Container(
    height: 120,
    width: 1,
    color: grey,
  );
}

Column _column(String title,
    {Color titleColor = red,
    Color btnColor = red,
    String? offerName,
    String btnName = '',
    String? keyTag,
    Function()? onTap}) {
  return Column(
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
              child: SMText(title: offerName, fontWeight: FontWeight.normal),
            )
          : SMText(
              title: "",
            ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMButton(
            height: 30,
            bgColor: btnColor,
            title: btnName,
            textColor: white,
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
  );
}

Widget _dateColumn(String title, String value) {
  return Column(
    children: [
      SMText(
        title: title,
        fontWeight: FontWeight.normal,
      ),
      SMText(
        title: _dateFormate(value),
        fontWeight: FontWeight.normal,
      )
    ],
  );
}

String _dateFormate(String date) {
  if (date.isEmpty) {
    return "";
  }
  DateTime dateTime = DateTime.parse(date);
  final DateFormat formatter = DateFormat('dd-MM-yyyy  HH:mm');
  final String formatted = formatter.format(dateTime);
  print("SKY ==== $formatted");
  return formatted;
}
