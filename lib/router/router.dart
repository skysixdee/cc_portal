import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/navigation_bar_view/navigation_bar_view.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/home_sceen.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: homeGoRoute,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: shellRouteIndex,
      branches: [
        homeScreen(),
      ],
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(child: errorWidget(context, state));
  },
);
Widget errorWidget(BuildContext context, GoRouterState state) {
  return const Scaffold(
    body: Center(child: Text("Error page loading")),
  );
}

StatefulShellBranch homeScreen() {
  return StatefulShellBranch(
    navigatorKey: _sectionNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: homeGoRoute,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}

Widget shellRouteIndex(
    context, state, StatefulNavigationShell navigationShell) {
  print("Selected index must be===== ${navigationShell.currentIndex}");

  double sideMenuWidth = 220.0;
  double navBarheight = 50.0;
  return GetMaterialApp(
    title: 'SM ADMIN PORTAL',
    debugShowCheckedModeBanner: false,
    home: Material(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: navBarheight),
                Expanded(
                  child: Stack(
                    children: [
                      SideMenuView(
                        sideMenuWidth: sideMenuWidth,
                      ),
                      Row(
                        children: [
                          SizedBox(width: sideMenuWidth),
                          Expanded(child: navigationShell),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            NavigationBarView(
                navBarheight: navBarheight, sideMenuWidth: sideMenuWidth),
          ],
        )),
  );
}
