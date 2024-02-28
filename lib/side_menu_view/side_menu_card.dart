import 'package:flutter/material.dart';

import 'package:sm_admin_portal/side_menu_view/side_menu_list_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget sideMenuCard({required String text, required bool isSelected}) {
  return Container(
      color:
          isSelected ? sixdLightColor : null, // Change the color when selected
      child: ListTile(
        title: Row(children: [
          Icon(
            Icons.circle,
            color: isSelected ? sixdColor : white,
            size: 15,
          ),
          const SizedBox(width: 11),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected ? sixdColor : black, fontSize: 10),
            ),
          )
        ]),
      ));
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SideMenuListView(),
            
    ),
  ));
}
