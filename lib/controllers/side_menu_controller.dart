import 'package:get/get.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/router/router_name.dart';

import 'package:sm_admin_portal/Models/side_menu_model.dart';

class SideMenuController extends GetxController {
  String selectedSubMenuTitle = suspendAndResumeStr;
  RxString selectedMenuTitle = subscriberManagementStr.obs;
  RxList<SideMenuModel> subMenuList = <SideMenuModel>[].obs;

  List<String> menuList = [
    subscriberManagementStr,
    "Role 1",
    "Role 2",
    "Role 3"
  ];

  onMenuCardTap(String title) {
    subMenuList.clear();
    selectedMenuTitle.value = title;
    if (title == menuList[0]) {
      _onSubscriberTap();
    } else if (title == menuList[1]) {
      _onRole1Tap();
    } else if (title == menuList[2]) {
      _onRole2Tap();
    } else {
      _onRole3Tap();
    }
  }

  onSubMenuCardTap(String title) {
    selectedSubMenuTitle = title;
  }

  _onSubscriberTap() {
    subMenuList.value = [
      SideMenuModel(suspendAndResumeStr, suspendResumeRoute),
      SideMenuModel(toneActivationStr, toneActivationRoute),
      SideMenuModel(bulkUploadStr, bulkUploadRoute),
      SideMenuModel(transactionHistoryStr, transactionHistoryRoute),
      SideMenuModel(subscriberDetailAndDeactivationStr, subscriberDetailRoute),
      SideMenuModel(copyToneStr, copyToneRoute),
    ];
  }

  _onRole1Tap() {
    subMenuList.value = [
      SideMenuModel(toneActivationStr, toneActivationRoute),
      SideMenuModel(transactionHistoryStr, transactionHistoryRoute),
    ];
  }

  _onRole2Tap() {
    subMenuList.value = [
      SideMenuModel(bulkUploadStr, bulkUploadRoute),
      SideMenuModel(transactionHistoryStr, transactionHistoryRoute),
      SideMenuModel(subscriberDetailAndDeactivationStr, subscriberDetailRoute),
      SideMenuModel(copyToneStr, copyToneRoute),
    ];
  }

  _onRole3Tap() {
    subMenuList.value = [
      SideMenuModel(suspendAndResumeStr, suspendResumeRoute),
      SideMenuModel(toneActivationStr, toneActivationRoute),
      SideMenuModel(copyToneStr, copyToneRoute),
    ];
  }
}
