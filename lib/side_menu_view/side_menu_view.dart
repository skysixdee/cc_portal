import 'package:flutter/material.dart';

import 'package:sm_admin_portal/side_menu_view/side_menu_footer_view.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_hide_button.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_list_view.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_search_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class SideMenuView extends StatelessWidget {
  final double sideMenuWidth;
  const SideMenuView({super.key, required this.sideMenuWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black12,
      width: sideMenuWidth,
      child: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: decorationContainer(),
            ),
            sideMenuHideButton()
          ],
        ),
      ),
    );
  }

  Container decorationContainer() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: sideMenuShadowColor,
            spreadRadius: 2,
            blurRadius: 7,
          )
        ],
        color: white,
      ),
      child: Column(
        children: [
          sideMenuSearchView(),
          Expanded(
            child: menuList(),
          ),
          sideMenuFooterView()
        ],
      ),
    );
  }

  Widget menuList() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Container(
            color: dividerColor,
            child: SideMenuListView(),
          ),
        ),
      ],
    );
  }
}
