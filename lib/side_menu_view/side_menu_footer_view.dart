import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget sideMenuFooterView() {
  return Obx(() {
    return Container(
      color: black12,
      height: 30,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            textAlign: TextAlign.center,
            appCont.isSideMenuHidden.value ? sixdeeStr : poweredByStr,
            style: const TextStyle(fontSize: 10, color: grey),
          ),
        ),
      ),
    );
  });
}
