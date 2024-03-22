import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/side_menu_model.dart';
import 'package:sm_admin_portal/utilily/images.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/router/router_name.dart';

import 'package:sm_admin_portal/Models/side_sub_menu_model.dart';

class SideMenuController extends GetxController {
  String selectedSubMenuTitle = suspendAndResumeStr;
  RxString selectedMenuTitle = "".obs;
  RxList<SideSubMenuModel> subMenuList = <SideSubMenuModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(milliseconds: 100));

    onMenuCardTap(menuList[0].title);
  }

  List<SideMenuModel> menuList = [
    SideMenuModel(subscriberManagementStr, delete0Png),
    SideMenuModel("Role 1", delete1Png),
    SideMenuModel("Role 2", delete2Png),
    SideMenuModel("Role 3", delete3Png),
  ];

  onMenuCardTap(String title) {
    if (selectedMenuTitle.value == title) {
      selectedMenuTitle.value = '';
      return;
    }
    subMenuList.clear();
    selectedMenuTitle.value = title;
    if (title == menuList[0].title) {
      _onSubscriberTap();
    } else if (title == menuList[1].title) {
      _onRole1Tap();
    } else if (title == menuList[2].title) {
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
      SideSubMenuModel(suspendAndResumeStr, suspendResumeRoute),
      SideSubMenuModel(toneActivationStr, toneActivationRoute),
      SideSubMenuModel(bulkUploadStr, bulkUploadRoute),
      SideSubMenuModel(transactionHistoryStr, transactionHistoryRoute),
      SideSubMenuModel(
          subscriberDetailAndDeactivationStr, subscriberDetailRoute),
      SideSubMenuModel(copyToneStr, copyToneRoute),
    ];
  }

  _onRole1Tap() {
    subMenuList.value = [
      SideSubMenuModel(toneActivationStr, toneActivationRoute),
      SideSubMenuModel(transactionHistoryStr, transactionHistoryRoute),
    ];
  }

  _onRole2Tap() {
    subMenuList.value = [
      SideSubMenuModel(bulkUploadStr, bulkUploadRoute),
      SideSubMenuModel(transactionHistoryStr, transactionHistoryRoute),
      SideSubMenuModel(
          subscriberDetailAndDeactivationStr, subscriberDetailRoute),
      SideSubMenuModel(copyToneStr, copyToneRoute),
    ];
  }

  _onRole3Tap() {
    subMenuList.value = [
      SideSubMenuModel(suspendAndResumeStr, suspendResumeRoute),
      SideSubMenuModel(toneActivationStr, toneActivationRoute),
      SideSubMenuModel(copyToneStr, copyToneRoute),
    ];
  }
}
