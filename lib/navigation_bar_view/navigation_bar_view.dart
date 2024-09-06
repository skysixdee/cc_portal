import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/navigation_bar_view/sixd_logo.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';

import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

import 'package:sm_admin_portal/utilily/strings.dart';

class NavigationBarView extends StatelessWidget {
  final double navBarheight;
  final double sideMenuWidth;
  NavigationBarView(
      {super.key, required this.navBarheight, required this.sideMenuWidth});
  String username = StoreManager().userProfile?.username ?? '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: navBarheight,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              children: [
                logoButton(),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [homeButton(context), userDeatilButton(context)],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: sixdColor,
            height: 2,
          )
        ],
      ),
    );
  }

  Container logoButton() {
    return Container(
      height: navBarheight,
      color: white,
      child: sixDeeLogo(sideMenuWidth),
    );
  }

  Obx userDeatilButton(BuildContext context) {
    return Obx(
      () {
        return SMButton(
          title: appCont.agentName.value,
          leadingChild: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: greyLight),
                child: Icon(
                  Icons.person,
                  size: 14,
                )),
          ),
          onTap: () {
            openGenericPopup(
              headerTitle: "$logoutCStr !",
              areYouSureYouWantToLogoutStr,
              primaryButtonTitle: confirmCStr,
              secondryButtonTitle: cancelCStr,
              primaryAction: () {
                StoreManager().logout();

                context.goNamed(dashBoardRoute);
              },
            );
          },
        );
      },
    );
  }

  SMButton homeButton(BuildContext context) {
    return SMButton(
      bgColor: transparent,
      titlePadding: EdgeInsets.only(left: 8, right: 16),
      title: homeStr,
      leadingChild: Icon(
        Icons.home,
        size: 20,
      ),
      onTap: () {
        context.goNamed(dashBoardRoute);
      },
    );
  }
}
