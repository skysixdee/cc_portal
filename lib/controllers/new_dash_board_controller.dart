import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/Models/tone_list_model.dart';
import 'package:sm_admin_portal/api_calls/delete_tone_api.dart';
import 'package:sm_admin_portal/api_calls/resume_api.dart';

import 'package:sm_admin_portal/api_calls/set_tone_api.dart';
import 'package:sm_admin_portal/api_calls/suspend_api.dart';
import 'package:sm_admin_portal/api_calls/tune_list_api.dart';
import 'package:sm_admin_portal/common/channal_mapping.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/convert_ncr_readbable_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_snack_bar.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/tune_consent_table.dart';
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
  RxBool isLoadingTunes = false.obs;
  RxBool isVerified = false.obs;
  RxInt selectedTab = 0.obs;
  RxBool isMaxLimitMessageVisible = false.obs;
  RxList<Offer> offers = <Offer>[].obs;
  Rx<UserType> userType = UserType.existingUser.obs;
  RxBool isSalatiUser = true.obs;
  //RxList<SettingsList> settingsList = <SettingsList>[].obs;

  List<List<GenericTableViewModel>> tuneTableList = [];
  List<List<GenericTableViewModel>> tuneConsentTableList = [];
  List<List<GenericTableViewModel>> musicTableList = [];
  String packName = '';
  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(Duration(milliseconds: 30));
    selectedTab.value = 0;
    if (StoreManager().isCustomerLoggedIn) {
      isLoading.value = true;
      isVerified.value = true;
      getSubscriptionDetail(StoreManager().customerNumber);
    }
    getMyTuneList();
  }

  getMyTuneList() async {
    isLoadingTunes.value = true;
    ToneListModel toneListModel = await toneListApi();
    List<Tonelist> tonelist = toneListModel.tonelist ?? [];
    await _createTableData(tuneTableList, tonelist);
    await _createTuneConsentData(tuneConsentTableList);
    isMaxLimitMessageVisible.value = tonelist.length >= maxToneCount;
    isLoadingTunes.value = false;
  }

  onSubmitButtonAction(String msisdn) async {
    if (msisdn.isEmpty) {
      smSnackBar(enterValidMsisdnStr);

      return;
    }
    if (msisdn.length < msisdnLength) {
      smSnackBar(enterValidMsisdnStr);

      return;
    }
    getSubscriptionDetail(msisdn);
  }

  getSubscriptionDetail(String msisdn) async {
    isLoading.value = true;
    this.msisdn = msisdn;

    GetSubscriptionModel subscriptionModel =
        await getSubscriptionDetailApi(msisdn);

    offers.value = subscriptionModel.offers ?? [];
    isSalatiUser.value = true;
    if (subscriptionModel.respCode == 1) {
      userType.value = UserType.newUser;
      try {
        userType.value = subscriptionModel.offers?.first.offerStatus == "D"
            ? UserType.inActiveUser
            : UserType.newUser;
      } catch (e) {}

      packName = '';
      appCont.isCustomerLoggedIn.value = true;
    } else if (subscriptionModel.respCode == 0) {
      userType.value = UserType.existingUser;

      packName = '';
      appCont.isCustomerLoggedIn.value = true;
      try {
        packName = offers[0].offerName ?? '';

        for (var i = 0; i < (subscriptionModel.offers?.length ?? 0); i++) {
          print("grpup id =====${subscriptionModel.offers?[i].groupId}");
          if (subscriptionModel.offers?[i].groupId != "2") {
            isSalatiUser.value = false;
            print("yes ir is salati");
          }
        }
      } catch (e) {
        print("got error while fetchinf pack name ");
      }
    } else {
      userType.value = UserType.userOnHold;
      isLoading.value = false;
      smSnackBar(subscriptionModel.message ?? someThingWentWrongStr);
      print("helo ======= ${subscriptionModel.respCode}");
      return;
    }

    isLoading.value = false;
    isVerified.value = true;

    StoreManager().setCustomerLoggedin(true);
    StoreManager().setCustomerNumber(msisdn);
    getMyTuneList();
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
      return suspendedStr;
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

  activateNewUser() {
    _activateDefaultTone();
  }

  activateTune() {
    _activateDefaultTone();
  }

  _activateDefaultTone() async {
    isLoading.value = true;
    GenericModal model = await setToneApi(defaultOfferCode, defaultToneId);
    if (model.respCode == 0) {
      getSubscriptionDetail(StoreManager().customerNumber);
      smSnackBar(model.message ?? someThingWentWrongStr);
    } else {
      smSnackBar(model.message ?? someThingWentWrongStr);
    }
    isLoading.value = false;
  }

  deactivateTuneTapped(
      GenericTableViewModel? info, String? toneId, String offerCode) async {
    print("deactivate tapped");
    openGenericPopup(
      areYouSureYouWantToDeActivateStr,
      primaryButtonTitle: confirmCStr,
      secondryButtonTitle: cancelCStr,
      primaryAction: () async {
        isLoading.value = true;
        GenericModal model = await deleteToneApi(toneId ?? 'All', offerCode);
        if (model.respCode == 0) {
          isLoadingTunes.value = true;
          tuneTableList.removeAt(info?.row ?? 0);
          isLoadingTunes.value = false;
        } else {
          smSnackBar(model.message ?? someThingWentWrongStr);
        }
        isLoading.value = false;
      },
    );

    //await Future.delayed(Duration(seconds: 2));
  }

  deactivateServiceTapped(String offerCode) async {
    print("deactivate tapped");
    openGenericPopup(
      areYouSureYouWantToDeActivateStr,
      primaryButtonTitle: confirmCStr,
      secondryButtonTitle: cancelCStr,
      primaryAction: () async {
        isLoading.value = true;
        GenericModal model = await deleteToneApi('All', offerCode);
        if (model.respCode == 0) {
          isLoadingTunes.value = true;
          tuneTableList.clear();
          isLoadingTunes.value = false;
        } else {
          smSnackBar(model.message ?? someThingWentWrongStr);
          isLoadingTunes.value = true;
          tuneTableList.clear();
          isLoadingTunes.value = false;
        }
        isLoading.value = false;
      },
    );

    //await Future.delayed(Duration(seconds: 2));
  }

  activateTapped(ToneInfo inf) async {
    print("activate tapped");
    isLoading.value = true;
    GenericModal model =
        await setToneApi(packName, inf.toneId ?? defaultToneId);
    if (model.respCode == 0) {
      smSnackBar(model.message ?? someThingWentWrongStr);
    } else {
      smSnackBar(model.message ?? someThingWentWrongStr);
    }
    isLoading.value = false;
  }

  suspendTapped() async {
    print("suspend Tapped ");
    isLoading.value = true;
    GenericModal model = await suspendApi(StoreManager().customerNumber);
    if (model.respCode == 0) {
    } else {
      smSnackBar(model.message ?? someThingWentWrongStr);
    }
    isLoading.value = false;
  }

  suspendPopup() async {
    print("suspend Tapped ");
    isLoading.value = true;
    GenericModal model = await suspendApi(StoreManager().customerNumber);
    if (model.respCode == 1002) {
      smSnackBar(model.message ?? someThingWentWrongStr);
    } else {}
    isLoading.value = false;
  }

  resumeTapped() async {
    print("resume Tapped ");
    isLoading.value = true;
    isLoading.value = true;
    GenericModal model = await resumeApi(StoreManager().customerNumber);
    if (model.respCode == 0) {
    } else {
      smSnackBar(model.message ?? someThingWentWrongStr);
    }
    isLoading.value = false;
  }
}

Future<void> _createTableData(List<List<GenericTableViewModel>> tuneTableList,
    List<Tonelist> tonelist) async {
  tuneTableList.clear();
  if (tonelist.isEmpty) {
    return;
  }

  for (Tonelist item in tonelist) {
    tuneTableList.add([
      GenericTableViewModel(
          columnTitle: toneNameStr,
          columnValue: convertNCRsToReadableText(
              item.contentName ?? ''), //(item.contentName ?? '').de,
          isVisible: true.obs,
          object: item),
      GenericTableViewModel(
          columnTitle: otherNameStr,
          columnValue: convertNCRsToReadableText(
              item.contentNameL2 ?? ''), //item.contentNameL2 ?? '',
          isVisible: false.obs,
          isRemovable: true,
          object: item),
      GenericTableViewModel(
          columnTitle: statusStr,
          columnValue: item.status ?? '',
          isVisible: true.obs,
          childType: ChildType.status,
          object: item),
      GenericTableViewModel(
          columnTitle: toneIdStr,
          columnValue: item.contentId ?? '',
          isVisible: true.obs,
          //isRemovable: true,
          object: item),
      GenericTableViewModel(
          columnTitle: ArtistStr,
          columnValue: convertNCRsToReadableText(item.artistName ?? ''),
          isVisible: false.obs,
          isRemovable: true,
          object: item),
      GenericTableViewModel(
          columnTitle: lastRenewedStr,
          columnValue: item.chargedDate ?? '',
          isVisible: false.obs,
          isRemovable: true,
          childType: ChildType.text,
          object: item),
      GenericTableViewModel(
          columnTitle: priceStr,
          columnValue: item.price ?? '',
          isVisible: false.obs,
          isRemovable: true,
          object: item),
      GenericTableViewModel(
          columnTitle: playStr,
          columnValue: '',
          isRemovable: true,
          isVisible: false.obs,
          object: item,
          childType: ChildType.play),
      GenericTableViewModel(
          columnTitle: activationChannelStr,
          columnValue: channelMapping(item.activationChannel ?? ''),
          isVisible: false.obs,
          object: item,
          isRemovable: true),
      GenericTableViewModel(
        columnTitle: actionStr,
        columnValue: DeactivateStr,
        childType: ChildType.button,
        isVisible: true.obs,
        object: item,
      ),
      GenericTableViewModel(
        columnTitle: consentRecordStr,
        columnValue: consentRecordStr,
        childType: ChildType.consent,
        isVisible: enableToneConsent.obs,
        isRemovable: enableToneConsent,
        object: item,
      ),
    ]);
  }
  return;
}

Future<void> _createTuneConsentData(
    List<List<GenericTableViewModel>> tuneConsentTableList) async {
  tuneConsentTableList.clear();
  // if (tonelist.isEmpty) {
  //   return;
  // }
  //for (Tonelist item in tonelist) {

  tuneConsentTableList.add([
    GenericTableViewModel(
      columnTitle: templateIdStr,
      columnValue: '3454646',
      isVisible: true.obs,
      childType: ChildType.clickableText,
      object: null,
    ),
    GenericTableViewModel(
      columnTitle: statusStr,
      columnValue: '',
      isVisible: true.obs,
      childType: ChildType.status,
      object: null,
    ),
    GenericTableViewModel(
      columnTitle: sendTimeStr,
      columnValue: '13:30',
      isVisible: true.obs,
      object: null,
    ),
    GenericTableViewModel(
      columnTitle: receivedTimeStr,
      columnValue: '12:00',
      isVisible: true.obs,
      object: null,
    ),
    GenericTableViewModel(
      columnTitle: receivedDataStr,
      columnValue: 'recieve data',
      isVisible: true.obs,
      object: null,
    ),
  ]);
  //}
  return;
}
