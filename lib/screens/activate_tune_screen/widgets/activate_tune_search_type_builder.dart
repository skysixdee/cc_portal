import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/activate_tune_controller.dart';
import 'package:cc_portal/enums/search_type.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';

Widget activateTuneSearchTypeBuilder(ActivateTuneController cont) {
  return SizedBox(
    height: 40,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: cont.searchTypeList.length,
      itemBuilder: (context, index) {
        return _radioButton(
            cont.searchTypeList[index], cont.searchTypeTitlList[index], cont);
      },
    ),
  );
}

Widget _radioButton(
    SearchType searchType, String title, ActivateTuneController cont) {
  return Obx(() {
    return InkWell(
      focusColor: transparent,
      hoverColor: transparent,
      splashColor: transparent,
      highlightColor: transparent,
      onTap: () {
        //cont.searchType.value =
        cont.updateSearchType(searchType);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              searchType == cont.searchType.value
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: sixdColor,
              size: 20,
            ),
            SizedBox(width: 2),
            SMText(
              title: title,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ),
    );
  });
}
