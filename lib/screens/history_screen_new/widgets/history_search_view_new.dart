import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:cc_portal/reusable_view/buttons/date_picker_button.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:cc_portal/common/date_formate.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/reusable_view/sm_shadow.dart';
import 'package:cc_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:cc_portal/screens/history_screen_new/widgets/date_picker.dart';

class HistorySearchViewNew extends StatelessWidget {
  HistorySearchViewNew({super.key});
  HistoryController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SMText(title: searchCStr),
        const SizedBox(height: 6),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: decoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 30),
                child: Row(
                  children: [
                    // Flexible(child: msisdnInputBuilder()),
                    // const SizedBox(width: 30),
                    Flexible(child: fromDateBuilder(context)),
                    const SizedBox(width: 30),
                    Flexible(child: toDateBuilder()),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: greyLight,
              ),
              bottomButtonBuilder(),
            ],
          ),
        ),
      ],
    );
  }

  Container bottomButtonBuilder() {
    return Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            searchButton(),
            const SizedBox(width: 12),
            resetbutton(),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

  SMButton resetbutton() {
    return SMButton(
      title: resetStr,
      bgColor: white,
      addBorder: true,
      onTap: () {
        con.resetButtonTap();
        con.transactionHistory();
      },
    );
  }

  SMButton searchButton() {
    return SMButton(
      title: searchStr,
      bgColor: sixdColor,
      textColor: white,
      onTap: () {
        con.transactionHistory();
      },
    );
  }

  Widget fromDateBuilder(BuildContext context) {
    return Obx(
      () {
        String val = dateFormate("${con.fromTD}", inFormate: 'dd-MM-yyyy');
        return DatePickerButton(
          selectedText: SMText(
              fontWeight: FontWeight.normal,
              title: con.isFromChanged.value ? val : val), //"selectedText",
          title: fromDateCStr,
          onTap: () {
            fromDatePicker();
          },
        );
      },
    );
  }

  void fromDatePicker() {
    Get.dialog(Center(
      child: Container(
          color: white,
          child: DatePicker(
            startDateTime: con.fromTD,
            onConfirm: (p0) {
              con.isFromChanged.value = true;
              con.fromTD = p0;
              // String dat = dateFormate("$p0", inFormate: "yyyy-MM-dd");
              // print("Date formate ==========$dat");
              con.isFromChanged.value = false;
              //Navigator.of(context).pop();
            },
          )),
    ));
  }

  void toDatePicker() {
    Get.dialog(Center(
      child: Container(
          color: white,
          child: DatePicker(
            startDateTime: con.toTD,
            onConfirm: (p0) {
              con.toTD = p0;
              con.isToChanged.value = true;
              //String dat = dateFormate("$p0", inFormate: "yyyy-MM-dd");
              con.isToChanged.value = false;
              //print("Date formate ==========$dat");
              //Navigator.of(context).pop();
            },
          )),
    ));
  }

  Widget toDateBuilder() {
    return Obx(
      () {
        String val = dateFormate("${con.toTD}", inFormate: 'dd-MM-yyyy');
        return DatePickerButton(
          selectedText: SMText(
              fontWeight: FontWeight.normal,
              title: con.isToChanged.value ? val : val), //"selectedText",
          title: toDateCStr,
          onTap: () {
            toDatePicker();
          },
        );
      },
    );
    // DatePickerButton(
    //   title: toDateCStr,
    //   selectedText: SMText(title: "selectedText"),
    //   onTap: () {
    //     toDatePicker();
    //   },
    // );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      boxShadow: smShadow(),
      color: white,
      borderRadius: BorderRadius.circular(4),
    );
  }
}
