import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

smSnackBar(String message) {
  Get.snackbar(
    padding: EdgeInsets.zero,
    borderRadius: 4,
    titleText: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: sixdColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SMText(
            title: message,
            textColor: white,
          ),
        ),
      ),
    ),
    maxWidth: 400,
    message,
    "",
    // messageText: SMText(
    //   title: "message",
    //   textColor: white,
    // ),
    backgroundColor: transparent,
    snackPosition: SnackPosition.BOTTOM,
  );
}
