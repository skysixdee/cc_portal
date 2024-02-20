import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/images.dart';

Widget sixDeeLogo(double sideMenuWidth) {
  return SizedBox(
      width: sideMenuWidth + 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 0, bottom: 0, right: 30),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: Center(child: Image.asset(sixDeeLogoPng))),
            const SizedBox(width: 8),
            Container(
              height: double.infinity,
              width: 1,
              color: dividerColor,
            )
          ],
        ),
      ));
}
