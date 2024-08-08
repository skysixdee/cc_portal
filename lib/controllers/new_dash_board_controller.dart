import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';

class NewDashBoardController extends GetxController {
  String msisdn = '';
  RxBool isLoading = false.obs;
  RxBool isVerified = false.obs;

  RxList<Offer> offers = <Offer>[].obs;
  Rx<UserType> userType = UserType.existingUser.obs;
  RxList<SettingsList> settingsList = <SettingsList>[].obs;

  onSubmitButtonAction(String msisdn) async {
    print("msis========= $msisdn");
    if (msisdn.isEmpty) {
      openGenericPopup("Enter some message here");
      return;
    }
    this.msisdn = msisdn;
    isVerified.value = false;
    GetSubscriptionModel subscriptionModel =
        await getSubscriptionDetailApi(msisdn);

    offers.value = subscriptionModel.offers ?? [];

    if (subscriptionModel.respCode == 1) {
      userType.value = UserType.newUser;
    } else if (subscriptionModel.respCode == 0) {
      userType.value = UserType.existingUser;
    } else {
      userType.value = UserType.invalidUser;
      isLoading.value = false;
      print("helo ======= ${subscriptionModel.respCode}");
      return;
    }

    StoreManager().setCustomerLoggedin(true);
    StoreManager().setCustomerNumber(msisdn);

    ListSettingModel settingModel = await listSettingApi(msisdn);
    settingsList.value = settingModel.settingsList ?? [];

    isLoading.value = false;
    isVerified.value = true;
  }

  String getColumnStatusName(String status) {
    if (status == "A") {
      return activeCStr;
    } else if (status == "G") {
      return graceCStr;
    } else if (status == "S") {
      return suspendedCStr;
    } else if (status == "P") {
      return pendingCStr;
    } else {
      return inActiveCStr;
    }
  }

  String getColumnButtonName(String status) {
    if (status == "A") {
      return DeactivateStr;
    } else if (status == "G") {
      return DeactivateStr;
    } else if (status == "S") {
      return DeactivateStr;
    } else if (status == "P") {
      return DeactivateStr;
    } else {
      return activateStr;
    }
  }

  activateNewUser() {
    print("Make api call here");
  }
}
