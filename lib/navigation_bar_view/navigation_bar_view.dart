import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/navigation_bar_view/sixd_logo.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/images.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class NavigationBarView extends StatelessWidget {
  final double navBarheight;
  final double sideMenuWidth;
  const NavigationBarView(
      {super.key, required this.navBarheight, required this.sideMenuWidth});

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
                Container(
                  height: navBarheight,
                  color: white,
                  child: sixDeeLogo(sideMenuWidth),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SMButton(
                        title: homeStr,
                        leadingChild: Icon(Icons.home),
                        onTap: () {
                          context.goNamed(dashBoardRoute);
                        },
                      ),
                      SMButton(
                        title: logoutStr,
                        leadingChild: Icon(Icons.logout),
                        onTap: () {
                          StoreManager().logout();

                          context.goNamed(dashBoardRoute);
                        },
                      )
                    ],
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
}
