import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/reusable_view/custom_text_field.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistorySearchView extends StatelessWidget {
  HistorySearchView({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SMText(title: searchCStr),
        const SizedBox(height: 6),
        Container(
          decoration: decoration(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 30),
                child: Row(
                  children: [
                    Flexible(child: msisdnInputBuilder()),
                    const SizedBox(width: 30),
                    Flexible(child: fromDateBuilder()),
                    const SizedBox(width: 30),
                    Flexible(child: toDateBuilder()),
                  ],
                ),
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
      color: bgColor,
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
    );
  }

  SMButton searchButton() {
    return SMButton(
      title: searchStr,
      bgColor: sixdColor,
      textColor: white,
    );
  }

  Widget msisdnInputBuilder() {
    return CustomReusableTextField(
      textController: textController,
      hintText: msisdnCStr,
      isNumberInput: true,
      title: msisdnCStr, ////bhavychanges
      Function: () {}, onChanged: (value) {}, isrequired: false,
    );
  }

  Widget fromDateBuilder() {
    return ReusbaleDropDownButton(
      items: [''],
      title: fromDateCStr,
      isDisplayPopup: false,
      onTap: () {
        print("Button tapped");
      },
      dropDownIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Icon(
          Icons.calendar_month,
          size: 16,
        ),
      ),
    );
  }

  Widget toDateBuilder() {
    return ReusbaleDropDownButton(
      items: [''],
      title: toDateCStr,
      isDisplayPopup: false,
      onTap: () {
        print("Button tapped");
      },
      dropDownIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Icon(
          Icons.calendar_month,
          size: 16,
        ),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      boxShadow: boxShadow,
      color: white,
      borderRadius: BorderRadius.circular(2),
    );
  }
}
