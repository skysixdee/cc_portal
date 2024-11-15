import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/images.dart';

Widget sixDeeLogo(double sideMenuWidth) {
  return SizedBox(
      //  width: sideMenuWidth + 1,
      child: Padding(
    padding: const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 10),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Expanded(
                child: Center(child: Image.asset(sixDeeLogoPng, height: 30))),
            const SizedBox(width: 8),
          ],
        ),
        SizedBox(width: 10),
        Container(
          height: double.infinity,
          width: 1,
          color: greyLight,
        )
      ],
    ),
  ));
}
