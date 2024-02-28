import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/navigation_bar_view/navigation_bar_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';
import 'package:sm_admin_portal/reusable_view/table_view.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/circle.dart';
import 'package:sm_admin_portal/screens/first_screen.dart';
import 'package:sm_admin_portal/screens/message.dart';
import 'package:sm_admin_portal/screens/message_template.dart';
import 'package:sm_admin_portal/screens/offers.dart';
import 'package:sm_admin_portal/screens/packs_screen.dart';
import 'package:sm_admin_portal/screens/home_sceen.dart';
import 'package:sm_admin_portal/screens/renewal_screen.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

import '../reusable_view/custom_text_field.dart';
import '../reusable_view/pop_over.dart';

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
        firstScreenScreen(),
        OffersScreenScreen(),
        PacksScreenScreen(),
        CircleScreenScreen(),
        MessageTemplateScreenScreen(),
        MessageScreenScreen(),
        RenewalScreenScreen()
      ],
    ),
  ],
  errorPageBuilder: (context, state) {
    return MaterialPage(child: errorWidget(context, state));
  },
);
Widget errorWidget(BuildContext context, GoRouterState state) {
  return const Scaffold(
    body: Center(
        child: Text(
      "Error page loading",
    )
        // Text()

        ),
  );
}

StatefulShellBranch homeScreen() {
  return StatefulShellBranch(
    navigatorKey: _sectionNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: homeGoRoute,
        builder: (context, state) {

          return  HomeScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch firstScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: firstScreenRoute,
        path: firstScreenRoute,
        builder: (context, state) {
          return const FirstScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch PacksScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: PacksScreenRoute,
        path: PacksScreenRoute,
        builder: (context, state) {
          return PacksScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch CircleScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: CircleScreenRoute,
        path: CircleScreenRoute,
        builder: (context, state) {
          return CircleScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch OffersScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: OffersScreenRoute,
        path: OffersScreenRoute,
        builder: (context, state) {
          return OffersScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch MessageScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: MessageScreenRoute,
        path: MessageScreenRoute,
        builder: (context, state) {
          return MessageScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch MessageTemplateScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: MessageTemplateScreenRoute,
        path: MessageTemplateScreenRoute,
        builder: (context, state) {
          return MessageTemplateScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch RenewalScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: RenewalScreenRoute,
        path: RenewalScreenRoute,
        builder: (context, state) {
          return RenewalScreen();



        },
      ),
    ],
  );
}

Widget shellRouteIndex(
    context, state, StatefulNavigationShell navigationShell) {
  print("Selected index must be===== ${navigationShell.currentIndex}");

  return GetMaterialApp(
    title: 'SM ADMIN PORTAL',
    debugShowCheckedModeBanner: false,
    home: Material(
        color: white,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: navBarheight),
                Expanded(child: Obx(() {
                  return Stack(
                    children: [
                      animatingSideMenu(sideMenuOpendWidth, animationTime),
                      Row(
                        children: [
                          enimationBufferWidthSideMenu(
                              sideMenuOpendWidth, animationTime),
                          Expanded(child: navigationShell),
                        ],
                      ),
                    ],
                  );
                })),
              ],
            ),
            const NavigationBarView(
                navBarheight: navBarheight, sideMenuWidth: sideMenuOpendWidth),
          ],
        )),
  );
}

AnimatedContainer enimationBufferWidthSideMenu(
    double sideMenuWidth, Duration animationTime) {
  return AnimatedContainer(
    width: appCont.isSideMenuHidden.value ? sideMenuClosedWidth : sideMenuWidth,
    duration: animationTime,
    child: SizedBox(
        width: appCont.isSideMenuHidden.value
            ? sideMenuClosedWidth
            : sideMenuWidth),
  );
}

AnimatedContainer animatingSideMenu(
    double sideMenuWidth, Duration animationTime) {
  return AnimatedContainer(
    width: appCont.isSideMenuHidden.value ? sideMenuClosedWidth : sideMenuWidth,
    duration: animationTime,
    child: appCont.isSideMenuHidden.value
        ? const SideMenuView(sideMenuWidth: sideMenuClosedWidth)
        : SideMenuView(sideMenuWidth: sideMenuWidth),
  );
}
