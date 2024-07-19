import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/sm_text_field/sm_text_field.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_search_button.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

SmTextField activateTuneTextField(TextEditingController textEditingController) {
  return SmTextField(
      textEditingController: textEditingController,
      hint: enterKeyWordToSearchStr,
      tailingWidget: activateTuneSearchButton() //searchButton(),
      );
}
