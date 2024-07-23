import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

Widget activateTuneSearchButton() {
  ActivateTuneController cont = Get.find();
  return InkWell(
      onTap: () {
        cont.searchText();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
          size: 16,
        ),
      ));
}
