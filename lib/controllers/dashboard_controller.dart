import 'package:get/get.dart';

import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';

import 'package:sm_admin_portal/enums/user_type.dart';

import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var isCustomerLoggedIn = false.obs;

  var phoneNumber = ''.obs;
  Rx<UserType> userType = UserType.existingUser.obs;
  //RxList<Offer> subscriptionList = <Offer>[].obs;
  RxList<Offer> offers = <Offer>[].obs;
  RxList<SettingsList> settingsList = <SettingsList>[].obs;

  //@override
  @override
  void onInit() {
    super.onInit();
  }

  void onSubmitButtonAction(String phoneNumber) async {
    if (phoneNumber.isEmpty) {
      openGenericPopup("message");
      return;
    }
    this.phoneNumber.value = phoneNumber;
    isLoading.value = true;
    GetSubscriptionModel subscriptionModel =
        await getSubscriptionDetailApi(phoneNumber);
    offers.value = subscriptionModel.offers ?? [];
    if (subscriptionModel.respCode == 1) {
      userType.value = UserType.newUser;
    } else if (subscriptionModel.respCode == 0) {
      userType.value = UserType.existingUser;
    } else {
      userType.value = UserType.invalidUser;
    }
    StoreManager().setCustomerLoggedin(true);
    StoreManager().setCustomerNumber(phoneNumber);

    ListSettingModel settingModel = await listSettingApi(phoneNumber);
    settingsList.value = settingModel.settingsList ?? [];
    isLoading.value = false;
  }

  activateNewUser() {
    print("Make api call here");
  }

  String getFirstColumnButtonName(String status) {
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

  String getSecondColumnButtonName(String status) {
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
}
