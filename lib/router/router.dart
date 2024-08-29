// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import 'package:go_router/go_router.dart';
// import 'package:sm_admin_portal/main.dart';
// import 'package:sm_admin_portal/navigation_bar_view/navigation_bar_view.dart';
// import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';
// import 'package:sm_admin_portal/reusable_view/table_view.dart';
// import 'package:sm_admin_portal/router/router_name.dart';
// import 'package:sm_admin_portal/screens/Bulk_Screen.dart';
// import 'package:sm_admin_portal/screens/circle.dart';
// import 'package:sm_admin_portal/screens/first_screen.dart';
// import 'package:sm_admin_portal/screens/history_screen/history_screen.dart';
// import 'package:sm_admin_portal/screens/message.dart';
// import 'package:sm_admin_portal/screens/tone_activation_screen.dart';
// import 'package:sm_admin_portal/screens/offers_screen.dart';
// import 'package:sm_admin_portal/screens/suspend_and_resume_screen/suspend_and_resume_screen.dart';
// import 'package:sm_admin_portal/screens/home_sceen.dart';
// import 'package:sm_admin_portal/screens/renewal_screen.dart';
// import 'package:sm_admin_portal/screens/subscriber_deatil_screen/subscriber_detail_screen1.dart';

// import 'package:sm_admin_portal/side_menu_view/side_menu_view.dart';
// import 'package:sm_admin_portal/utilily/colors.dart';
// import 'package:sm_admin_portal/utilily/constants.dart';
// import '../reusable_view/custom_text_field.dart';
// import '../reusable_view/pop_over.dart';
// import '../screens/copy_screen/copy_screen.dart';

// final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _sectionNavigatorKey = GlobalKey<NavigatorState>();

// final router = GoRouter(
//   navigatorKey: _rootNavigatorKey,
//   initialLocation: homeGoRoute,
//   routes: <RouteBase>[
//     StatefulShellRoute.indexedStack(
//       builder: shellRouteIndex,
//       branches: [
//         _homeScreen(),
//         firstScreenScreen(),
//         OffersScreenScreen(),
//         PacksScreenScreen(),
//         _subscriberDetailRouteScreen(),
//         MessageTemplateScreenScreen(),
//         MessageScreenScreen(),
//         RenewalScreenScreen(),
//         _bulkScreenScreen(),
//         _historyScreenScreen()
//       ],
//     ),
//   ],
//   errorPageBuilder: (context, state) {
//     return MaterialPage(child: errorWidget(context, state));
//   },
// );
// Widget errorWidget(BuildContext context, GoRouterState state) {
//   return const Scaffold(
//     body: Center(
//         child: Text(
//       "Error page loading",
//     )
//         // Text()

//         ),
//   );
// }

// StatefulShellBranch _homeScreen() {
//   return StatefulShellBranch(
//     navigatorKey: _sectionNavigatorKey,
//     routes: <RouteBase>[
//       GoRoute(
//         path: homeGoRoute,
//         builder: (context, state) {
//           return HomeScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch firstScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: firstScreenRoute,
//         path: firstScreenRoute,
//         builder: (context, state) {
//           return const FirstScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch PacksScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: PacksScreenRoute,
//         path: PacksScreenRoute,
//         builder: (context, state) {
//           return SuspendAndResumeScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch _subscriberDetailRouteScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: subscriberDetailRoute,
//         path: subscriberDetailRoute,
//         builder: (context, state) {
//           return SubscriberDetailScreen1();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch OffersScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: OffersScreenRoute,
//         path: OffersScreenRoute,
//         builder: (context, state) {
//           return CopyScreen(); //OffersScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch MessageScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: MessageScreenRoute,
//         path: MessageScreenRoute,
//         builder: (context, state) {
//           return MessageScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch MessageTemplateScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: MessageTemplateScreenRoute,
//         path: MessageTemplateScreenRoute,
//         builder: (context, state) {
//           return ToneActivationScreen();
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch _bulkScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: bulkScreenRoute,
//         path: bulkScreenRoute,
//         builder: (context, state) {
//           return Container(child: BulkScreen()
//               // Text("Bulk Scren"),
//               );
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch _historyScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: historyScreenRoute,
//         path: historyScreenRoute,
//         builder: (context, state) {
//           return Container(
//             child: HistoryScreen(),
//           );
//         },
//       ),
//     ],
//   );
// }

// StatefulShellBranch RenewalScreenScreen() {
//   return StatefulShellBranch(
//     routes: <RouteBase>[
//       GoRoute(
//         name: RenewalScreenRoute,
//         path: RenewalScreenRoute,
//         builder: (context, state) {
//           return RenewalScreen();
//         },
//       ),
//     ],
//   );
// }

// Widget shellRouteIndex(
//     context, state, StatefulNavigationShell navigationShell) {
//   print("Selected index must be===== ${navigationShell.currentIndex}");

//   return GetMaterialApp(
//     title: 'SM ADMIN PORTAL',
//     debugShowCheckedModeBanner: false,
//     home: Material(
//         color: white,
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 const SizedBox(height: navBarheight),
//                 Expanded(child: Obx(() {
//                   return Stack(
//                     children: [
//                       animatingSideMenu(sideMenuOpendWidth, animationTime),
//                       Row(
//                         children: [
//                           enimationBufferWidthSideMenu(
//                               sideMenuOpendWidth, animationTime),
//                           Expanded(child: navigationShell),
//                         ],
//                       ),
//                     ],
//                   );
//                 })),
//               ],
//             ),
//             const NavigationBarView(
//                 navBarheight: navBarheight, sideMenuWidth: sideMenuOpendWidth),
//           ],
//         )),
//   );
// }

// AnimatedContainer enimationBufferWidthSideMenu(
//     double sideMenuWidth, Duration animationTime) {
//   return AnimatedContainer(
//     width: appCont.isSideMenuHidden.value ? sideMenuClosedWidth : sideMenuWidth,
//     duration: animationTime,
//     child: SizedBox(
//         width: appCont.isSideMenuHidden.value
//             ? sideMenuClosedWidth
//             : sideMenuWidth),
//   );
// }

// AnimatedContainer animatingSideMenu(
//     double sideMenuWidth, Duration animationTime) {
//   return AnimatedContainer(
//     width: appCont.isSideMenuHidden.value ? sideMenuClosedWidth : sideMenuWidth,
//     duration: animationTime,
//     child: appCont.isSideMenuHidden.value
//         ? const SideMenuView(sideMenuWidth: sideMenuClosedWidth)
//         : SideMenuView(sideMenuWidth: sideMenuWidth),
//   );
// }
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/controllers/tone_active_controller.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/navigation_bar_view/navigation_bar_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';
import 'package:sm_admin_portal/reusable_view/table_view.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/Bulk_Screen.dart';
import 'package:sm_admin_portal/screens/Key_clock/key_clock_screen.dart';
import 'package:sm_admin_portal/screens/Tunelist_screen.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/activate_tune_screen.dart';
import 'package:sm_admin_portal/screens/circle.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/dashboard_new_screen.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/dashboard_screen.dart';
import 'package:sm_admin_portal/screens/first_screen.dart';
import 'package:sm_admin_portal/screens/history_screen/history_screen.dart';
import 'package:sm_admin_portal/screens/message.dart';
import 'package:sm_admin_portal/screens/tone_activation_screen.dart';
import 'package:sm_admin_portal/screens/offers_screen.dart';
import 'package:sm_admin_portal/screens/suspend_and_resume_screen/suspend_and_resume_screen.dart';
import 'package:sm_admin_portal/screens/home_sceen.dart';
import 'package:sm_admin_portal/screens/renewal_screen.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/subscriber_detail_screen1.dart';

import 'package:sm_admin_portal/side_menu_view/side_menu_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import '../reusable_view/custom_text_field.dart';
import '../reusable_view/pop_over.dart';
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
        _subscriberDetailShell(),
        _bulkScreenShell(),
        _transactionHistoryShell(),
        _copyScreenShell(),
        tuneListShell(),
        _activateScreenShell(),
        /*
        MessageTemplateScreenScreen(),
        RenewalScreenScreen(),
        _bulkScreenScreen(),
        _historyScreenScreen()
        */
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

StatefulShellBranch dashBoardShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: dashBoardRoute,
        path: dashBoardRoute,
        builder: (context, state) {
          return DashboardNewScreen(); //KeyClockScreen(); //DashboardNewScreen();
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

StatefulShellBranch _subscriberDetailShell() {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        name: subscriberDetailRoute,
        path: subscriberDetailRoute,
        builder: (context, state) {
          return SubscriberDetailScreen1(); //OffersScreen();
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
