import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/activate_tune_controller.dart';
import 'package:cc_portal/reusable_view/sm_text_field/sm_text_field.dart';
import 'package:cc_portal/screens/activate_tune_screen/widgets/activate_tune_search_button.dart';
import 'package:cc_portal/utilily/strings.dart';

SmTextField activateTuneTextField(TextEditingController textEditingController) {
  ActivateTuneController cont = Get.find();
  return SmTextField(
    onChange: (p0) {
      cont.onChangeText(p0);
      if (cont.onSearchTap != null) {
        if (p0.isEmpty) {
          cont.onSearchTap!("");
        }
      }
    },
    onSubmit: (p0) {
      cont.searchText();
      if (cont.onSearchTap != null) {
        cont.onSearchTap!(cont.searchedText);
      }
    },
    textEditingController: textEditingController,
    hint: enterKeyWordToSearchStr,
    //tailingWidget: activateTuneSearchButton(), //searchButton(),
  );
}
