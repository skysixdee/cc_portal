import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/strings.dart';

Widget sideMenuHideButton() {
  return InkWell(
    onTap: () {
      appCont.isSideMenuHidden.value = !appCont.isSideMenuHidden.value;
      print("Hide button tapped");
    },
    child: Container(
      color: dividerColor,
      width: hideButtonWidth,
      height: 80,
      child: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                appCont.isSideMenuHidden.value ? openTitleStr : hideTitleStr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                    color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Icon(
                appCont.isSideMenuHidden.value
                    ? Icons.chevron_right
                    : Icons.chevron_left,
                size: 14,
                color: grey,
              )
            ],
          );
        }),
      ),
    ),
  );
}
