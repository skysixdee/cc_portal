import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget activateButton(GenericTableViewModel? info) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SMButton(
        //height: 30,
        title: activateStr,
        textColor: sixdColor,
        onHoverColor: sixdColor,
        onHoverTitleColor: white,
        bgColor: white,
        addBorder: true,
        addHoverEffect: true,
        fontWeight: FontWeight.normal,
        onTap: () {
          ToneInfo inf = info?.object as ToneInfo;
          print("tapped ${inf.toneName}");
          print("tapped ${inf.toneIdStreamingUrl}");
          openBuyTunePopup(inf.toneName ?? '', inf.toneId ?? '');
        },
      ),
    ],
  ); //Container(height: 30,width: 30,color: sixdColor,child: Icon(Icons.play_arrow),);
}
