// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:sm_admin_portal/Models/list_setting_modal.dart';

// import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
// import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
// import 'package:sm_admin_portal/api_calls/list_settings_api.dart';

// class DashboardController extends GetxController {
//   var isLoading = false.obs;
//   var isSubmitted = false.obs;
//   var mobileNumber = ''.obs;
//   var phoneNumber = ''.obs;

//   var subscriptionDetails = <Map<String, dynamic>>[].obs;

//   void handleSubmit(String phoneNumber) async {
//     ListSettingModel listSettingData = await listSettingApi();

//     SettingsList? settings = listSettingData.settingsList?.isNotEmpty == true
//         ? listSettingData.settingsList?.first
//         : null;

//     String tempStatus = settings?.status == 'A' ? 'ACTIVE' : 'SUSPENDED';

//     if (phoneNumber.length == 10) {
//       isLoading.value = true;

//       try {
//         GetSubscriptionModel subscriptionData =
//             await getSubscriptionDetailApi(phoneNumber);

//         if (subscriptionData.respCode == 0 &&
//             subscriptionData.offers != null &&
//             subscriptionData.offers!.isNotEmpty) {
//           var offer = subscriptionData.offers![0];

//           subscriptionDetails.value = [
//             {
//               'subscription': 'Subscription:',
//               'status': offer.offerStatus == 'S' ? 'SUSPEND' : 'INACTIVE',
//               'statusColor':
//                   offer.offerStatus == 'S' ? Colors.green : Colors.red,
//               'details': offer.offerName,
//               'buttonText':
//                   offer.offerStatus == 'S' ? 'Activate' : 'Deactivate',
//               'offerStatus': offer.offerStatus,

//             },
//             {
//               'subscription': 'Temp Status:',
//               'status': tempStatus,
//               'statusColor': tempStatus == 'ACTIVE' ? Colors.green : Colors.red,
//               'details': '',
//               'buttonText':
//                   tempStatus == 'ACTIVE' ? 'Suspend Service' : 'Resume Service',
//             },
//             {
//               'subscription': 'Last Renewed on',
//               'status': '',
//               'statusColor': null,
//               'details': offer.chargedDate,
//               'buttonText': '',
//             },
//             {
//               'subscription': 'Next Renewal Date',
//               'status': '',
//               'statusColor': null,
//               'details': offer.expiryDate,
//               'buttonText': '',
//             },
//           ];
//         }
//         isSubmitted.value = true;
//         mobileNumber.value = phoneNumber;
//       } finally {
//         isLoading.value = false;
//       }
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var isSubmitted = false.obs;
  var mobileNumber = ''.obs;
  var phoneNumber = ''.obs;
  RxList<Offer> subscriptionList = <Offer>[].obs;
  RxList<SettingsList> settingsList = <SettingsList>[].obs;
  var subscriptionDetails = <Map<String, dynamic>>[].obs;

  void handleSubmit(String phoneNumber) async {
    isLoading.value = true;
    ListSettingModel listSettingData = await listSettingApi();

    GetSubscriptionModel getSubscriptionModel =
        await getSubscriptionDetailApi(mobileNumber.value);

    subscriptionList.value = getSubscriptionModel.offers ?? [];
    isLoading.value = false;
    settingsList.value = listSettingData.settingsList ?? [];
    if (listSettingData.respCode == 0) {
      isSubmitted.value = true;
    }
    // SettingsList? settings = listSettingData.settingsList?.isNotEmpty == true
    //     ? listSettingData.settingsList?.first
    //     : null;

    // String tempStatus = settings?.status == 'A' ? 'ACTIVE' : 'SUSPENDED';

    // if (phoneNumber.length == 10) {
    //   isLoading.value = true;

    //   try {
    //     GetSubscriptionModel subscriptionData =
    //         await getSubscriptionDetailApi(phoneNumber);

    //     if (subscriptionData.respCode == 0 &&
    //         subscriptionData.offers != null &&
    //         subscriptionData.offers!.isNotEmpty) {
    //       var offer = subscriptionData.offers![0];

    //       subscriptionDetails.value = [
    //         {
    //           'subscription': 'Subscription:',
    //           'status': offer.offerStatus == 'S' ? 'SUSPEND' : 'INACTIVE',
    //           'statusColor':
    //               offer.offerStatus == 'S' ? Colors.green : Colors.red,
    //           'details': offer.offerName,
    //           'buttonText':
    //               offer.offerStatus == 'S' ? 'Activate' : 'Deactivate',
    //           'offerStatus': offer.offerStatus,
    //         },
    //         {
    //           'subscription': 'Temp Status:',
    //           'status': tempStatus,
    //           'statusColor': tempStatus == 'ACTIVE' ? Colors.green : Colors.red,
    //           'details': '',
    //           'buttonText':
    //               tempStatus == 'ACTIVE' ? 'Suspend Service' : 'Resume Service',
    //         },
    //         {
    //           'subscription': 'Last Renewed on',
    //           'status': '',
    //           'statusColor': null,
    //           'details': offer.chargedDate,
    //           'buttonText': '',
    //         },
    //         {
    //           'subscription': 'Next Renewal Date',
    //           'status': '',
    //           'statusColor': null,
    //           'details': offer.expiryDate,
    //           'buttonText': '',
    //         },
    //       ];
    //     }
    //     isSubmitted.value = true;
    //     mobileNumber.value = phoneNumber;
    //   } finally {
    //     isLoading.value = false;
    //   }
    //}
  }
}
