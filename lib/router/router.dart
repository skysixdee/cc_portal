import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:go_router/go_router.dart';

import 'package:cc_portal/main.dart';
import 'package:cc_portal/navigation_bar_view/navigation_bar_view.dart';

import 'package:cc_portal/router/router_name.dart';
import 'package:cc_portal/screens/Bulk_Screen.dart';
import 'package:cc_portal/screens/Key_clock/key_clock_screen.dart';
import 'package:cc_portal/screens/Tunelist_screen.dart';
import 'package:cc_portal/screens/activate_tune_screen/activate_tune_screen.dart';
import 'package:cc_portal/screens/dashboard_screen/dashboard_new_screen.dart';
import 'package:cc_portal/screens/history_screen/history_screen.dart';
import 'package:cc_portal/screens/login_page.dart';
import 'package:cc_portal/screens/test_screen/test_screen.dart';

import 'package:cc_portal/screens/tone_activation_screen.dart';

import 'package:cc_portal/screens/suspend_and_resume_screen/suspend_and_resume_screen.dart';

import 'package:cc_portal/side_menu_view/side_menu_view.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

import '../screens/copy_screen/copy_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: dashBoardRoute,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: shellRouteIndex,
      branches: [
        dashBoardShell(),
        _suspendAndResumeShell(),
        _toneActivationShell(),
        _bulkScreenShell(),
        _transactionHistoryShell(),
        _copyScreenShell(),
        tuneListShell(),
        _activateScreenShell(),
        _loginShell(),
        /*
        MessageTemplateScreenScreen(),
        RenewalScreenScreen(),
        _bulkScreenScreen(),
        _historyScreenScreen()
        */
      ],
    ),
  ],
  redirect: (context, state) {
    String path = state.fullPath ?? '';
    //if (path == dashBoardRoute) {
    appCont.isEnableBackButton.value = path != dashBoardRoute;
    //}
    if (!StoreManager().isCustomerLoggedIn) {
      if (path == tuneListRoute || path == activateScreenRoute) {
        return dashBoardRoute;
      } else {
        return null;
      }
    } else {
      return null;
    }
  },
  errorPageBuilder: (context, state) {
    return MaterialPage(child: _errorWidget(context, state));
  },
);
Widget _errorWidget(BuildContext context, GoRouterState state) {
  return const Scaffold(
    body: Center(
        child: Text(
      "Error page loading",
    )
        // Text()

        ),
  );
}

StatefulShellBranch _suspendAndResumeShell() {
  return StatefulShellBranch(
    navigatorKey: _sectionNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        name: suspendResumeRoute,
        path: suspendResumeRoute,
        builder: (context, state) {
          return SuspendAndResumeScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _toneActivationShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: toneActivationRoute,
        path: toneActivationRoute,
        builder: (context, state) {
          return ToneActivationScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _loginShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: loginRoute,
        path: loginRoute,
        builder: (context, state) {
          return LoginPage();
        },
      ),
    ],
  );
}

StatefulShellBranch dashBoardShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: dashBoardRoute,
        path: dashBoardRoute,
        builder: (context, state) {
          return DashboardNewScreen(); //KeyClockScreen(); //TestScreen(); //
        },
      ),
    ],
  );
}

StatefulShellBranch _activateScreenShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: activateScreenRoute,
        path: activateScreenRoute,
        builder: (context, state) {
          return ActivateTuneScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch tuneListShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: tuneListRoute,
        path: tuneListRoute,
        builder: (context, state) {
          return TuneListScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _bulkScreenShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: bulkUploadRoute,
        path: bulkUploadRoute,
        builder: (context, state) {
          return BulkScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _transactionHistoryShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: transactionHistoryRoute,
        path: transactionHistoryRoute,
        builder: (context, state) {
          return HistoryScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _copyScreenShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: copyToneRoute,
        path: copyToneRoute,
        builder: (context, state) {
          return CopyScreen();
        },
      ),
    ],
  );
}

/*

StatefulShellBranch MessageTemplateScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: MessageTemplateScreenRoute,
        path: MessageTemplateScreenRoute,
        builder: (context, state) {
          return ToneActivationScreen();
        },
      ),
    ],
  );
}

StatefulShellBranch _bulkScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: bulkScreenRoute,
        path: bulkScreenRoute,
        builder: (context, state) {
          return Container(child: BulkScreen()
              // Text("Bulk Scren"),
              );
        },
      ),
    ],
  );
}

StatefulShellBranch _historyScreenScreen() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: historyScreenRoute,
        path: historyScreenRoute,
        builder: (context, state) {
          return Container(
            child: HistoryScreen(),
          );
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
*/
Widget shellRouteIndex(
    context, state, StatefulNavigationShell navigationShell) {
  print("Selected index must be===== ${navigationShell.currentIndex}");

  return GetMaterialApp(
    title: 'CC PORTAL',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: sixdLightColor,
      ),
    ),
    home: SelectionArea(
      child: Material(
          color: white,
          child: Stack(
            children: [
              Column(
                children: [
                  Obx(
                    () {
                      return SizedBox(
                          height: navBarheight +
                              (appCont.isCustomerLoggedIn.value ? 40 : 0));
                    },
                  ),
                  Expanded(child: navigationShell),
                  // Expanded(child: Obx(() {
                  //   return Stack(
                  //     children: [
                  //       animatingSideMenu(sideMenuOpendWidth, animationTime),
                  //       Row(
                  //         children: [
                  //           enimationBufferWidthSideMenu(
                  //               sideMenuOpendWidth, animationTime),
                  //           Expanded(child: navigationShell),
                  //         ],
                  //       ),
                  //     ],
                  //   );
                  // })),
                ],
              ),
              NavigationBarView(
                  navBarheight: navBarheight,
                  sideMenuWidth: sideMenuOpendWidth),
            ],
          )),
    ),
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
