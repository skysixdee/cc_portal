import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/navigation_bar_view/sixd_logo.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';

import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

import 'package:sm_admin_portal/utilily/strings.dart';

class NavigationBarView extends StatelessWidget {
  final double navBarheight;
  final double sideMenuWidth;
  NavigationBarView(
      {super.key, required this.navBarheight, required this.sideMenuWidth});
  String username = StoreManager().userProfile?.username ?? '';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Container(
          height: navBarheight + (appCont.isCustomerLoggedIn.value ? 40 : 0),
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
                        children: [
                          // homeButton(context),
                          productName1(),
                          userDeatilButton(context)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: sixdColor,
                height: 2,
              ),
              appCont.isCustomerLoggedIn.value
                  ? Expanded(
                      child: customerDetail(context),
                    )
                  : SizedBox()
            ],
          ),
        );
      },
    );
  }

  Widget productName1() {
    return SMText(
      title: productName.toUpperCase(),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
  }

  Widget customerDetail(BuildContext context) {
    final NewDashBoardController controller = Get.find();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 28.0),
          child: Container(
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    backButton(context),
                    Icon(Icons.call, size: 18),
                    SizedBox(width: 8),
                    SMText(
                        title: "$countryCode ${StoreManager().customerNumber}"),
                  ],
                ),
                switchUserButton(controller, context)
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: sixdColor,
        ),
      ],
    );
  }

  Widget backButton(BuildContext context) {
    return Obx(
      () {
        return !appCont.isEnableBackButton.value
            ? SizedBox(width: 10)
            : SMButton(
                titlePadding: EdgeInsets.only(left: 8, right: 40),
                leadingChild: Icon(Icons.arrow_back),
                title: '',
                onTap: () {
                  context.goNamed(dashBoardRoute);
                },
              );
      },
    );
  }

  SMButton switchUserButton(
      NewDashBoardController controller, BuildContext context) {
    return SMButton(
      titlePadding: EdgeInsets.zero,
      title: switchAccountStr,
      fontWeight: FontWeight.bold,
      fontSize: 12,
      leadingChild: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Icon(
          Icons.switch_account_rounded,
          //color: sixdColor,
        ),
      ),
      onTap: () {
        openGenericPopup(
          headerTitle: switchAccountStr.toUpperCase(),
          areYouSureYouWantToChangeUserStr,
          secondryButtonTitle: cancelCStr,
          primaryButtonTitle: confirmCStr,
          primaryAction: () {
            controller.isVerified.value = false;
            controller.msisdn = '';
            appCont.isCustomerLoggedIn.value = false;
            controller.msisdn = '';
            StoreManager().setCustomerLoggedin(false);
            context.goNamed(dashBoardRoute);
          },
        );
      },
    );
  }

  Container logoButton() {
    return Container(
      height: navBarheight,
      color: white,
      child: sixDeeLogo(sideMenuWidth),
    );
  }

  Widget userDeatilButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        homeButton(context),
        Obx(
          () {
            return SMButton(
              title: appCont.agentName.value,
              leadingChild: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: greyLight),
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
        ),
      ],
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
