import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/reusable_view/sm_visibility_view.dart';

import 'package:cc_portal/side_menu_view/side_menu_footer_view.dart';
import 'package:cc_portal/side_menu_view/side_menu_hide_button.dart';
import 'package:cc_portal/side_menu_view/side_menu_list_view.dart';
//import 'package:cc_portal/side_menu_view/side_menu_search_view.dart';
import 'package:cc_portal/utilily/colors.dart';

class SideMenuView extends StatelessWidget {
  final double sideMenuWidth;
  const SideMenuView({super.key, required this.sideMenuWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
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
          // sideMenuSearchView(SearchController()),
          Expanded(
            child: menuList(),
          ),
          smVisibilityView(
              sideMenuFooterView(), !appCont.isSideMenuHidden.value)
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
