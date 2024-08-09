import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/api_calls/delete_tone_api.dart';

import 'package:sm_admin_portal/api_calls/set_tone_api.dart';
import 'package:sm_admin_portal/reusable_view/sm_snack_bar.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
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

  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(Duration(milliseconds: 30));
    if (StoreManager().isCustomerLoggedIn) {
      isLoading.value = true;
      isVerified.value = false;
      onSubmitButtonAction(StoreManager().customerNumber);
    }
  }

  onSubmitButtonAction(String msisdn) async {
    print("msis========= $msisdn");
    if (msisdn.isEmpty) {
      openGenericPopup("Enter some message here");
      return;
    }
    isLoading.value = true;
    this.msisdn = msisdn;
    //isVerified.value = false;
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

    ListSettingModel settingModel = await listSettingApi(msisdn);
    settingsList.value = settingModel.settingsList ?? [];

    isLoading.value = false;
    isVerified.value = true;
    StoreManager().setCustomerLoggedin(true);
    StoreManager().setCustomerNumber(msisdn);
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

  String getSecondColumnStatusName(String status) {
    if (status == "A") {
      return activeCStr;
    } else if (status == "G") {
      return suspendedCStr;
    } else if (status == "S") {
      return suspendedCStr;
    } else if (status == "P") {
      return suspendedCStr;
    } else {
      return suspendedCStr;
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

  String getSecondColumnButtonName(String status) {
    if (status == "A") {
      return suspendedCStr;
    } else if (status == "G") {
      return resumeStr;
    } else if (status == "S") {
      return resumeStr;
    } else if (status == "P") {
      return resumeStr;
    } else {
      return resumeStr;
    }
  }

  activateNewUser() async {
    isLoading.value = true;

    GenericModal model = await setToneApi(defaultOfferCode, defaultToneId);
    if (model.respCode == 0) {
      onSubmitButtonAction(StoreManager().customerNumber);
      smSnackBar(model.message ?? someThingWentWrongStr);
    } else {
      smSnackBar(model.message ?? someThingWentWrongStr);
    }
    isLoading.value = false;
  }

  deactivateTapped() async {
    print("deactivate tapped");
    deleteToneApi("offerStatus");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  activateTapped() async {
    print("activate tapped");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  suspendTapped() async {
    print("suspend Tapped ");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  resumeTapped() async {
    print("resume Tapped ");
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }
}
