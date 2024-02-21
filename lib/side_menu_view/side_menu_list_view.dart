import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget sideMenuListView() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 6,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: sideMenuCard("$index"),
      );
    },
  );
}
