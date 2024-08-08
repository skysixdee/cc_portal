import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/navigation_bar_view/sixd_logo.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/images.dart';

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
                IconButton(
                  icon: Icon(Icons.dashboard),
                  onPressed: () {
                    context.goNamed(dashBoardRoute);
                  },
                ),
                Text('Dashboard'),
                SizedBox(
                  width: 850,
                ),
                IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    // context.goNamed(dashBoardRoute);
                  },
                ),
                Text('Logout')
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
