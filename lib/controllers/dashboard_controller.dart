// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:sm_admin_portal/Models/list_setting_modal.dart';

// import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
// import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
// import 'package:sm_admin_portal/api_calls/list_settings_api.dart';





import 'package:get/get.dart';

import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';

import 'package:intl/intl.dart';



class DashboardController extends GetxController {
  var isLoading = false.obs;
  var isSubmitted = false.obs;
  var mobileNumber = ''.obs;
  var phoneNumber = ''.obs;

  RxList<Offer> subscriptionList = <Offer>[].obs;
  RxList<SettingsList> settingsList = <SettingsList>[].obs;
  var subscriptionDetails = <Map<String, dynamic>>[].obs;

  var respCode = 0.obs;
void handleSubmit(String phoneNumber) async {
  isLoading.value = true;
  isSubmitted.value = true;
  mobileNumber.value = phoneNumber;

  // Fetch data from APIs
  GetSubscriptionModel getSubscriptionModel = await getSubscriptionDetailApi(phoneNumber);
  ListSettingModel listSettingData = await listSettingApi(phoneNumber);

  // Update settings and subscription lists
  settingsList.value = listSettingData.settingsList ?? [];
  subscriptionList.value = getSubscriptionModel.offers?.map((offer) {
        offer.expiryDate = _formatDate(offer.expiryDate);
        offer.chargedDate = _formatDate(offer.chargedDate);
        return offer;
      })?.toList() ??
      [];

  // Log the updated respCodes for debugging
  print("Updated getSubscriptionModel respCode: ${getSubscriptionModel.respCode}");
  print("Updated listSettingData respCode: ${listSettingData.respCode}");

  // Update isLoading and respCode based on the API responses
  isLoading.value = false;

  // Set respCode based on getSubscriptionDetailApi
  respCode.value = getSubscriptionModel.respCode ?? 0;

  // Optionally, update isSubmitted based on the respCode from getSubscriptionDetailApi
  if (respCode.value == 0) {
    isSubmitted.value = true;
  }
}

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return "";

    DateTime parsedDate = DateTime.parse(date);
    String day = DateFormat('d').format(parsedDate);
    String month = DateFormat('MMM').format(parsedDate);
    String year = DateFormat('yyyy').format(parsedDate);

    String dayWithSuffix = _getDayWithSuffix(int.parse(day));

    return '$dayWithSuffix $month $year';
  }

  String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }
}
// class DashboardController extends GetxController {
//   var isLoading = false.obs;
//   var isSubmitted = false.obs;
//   var mobileNumber = ''.obs;
//   var phoneNumber = ''.obs;

//   RxList<Offer> subscriptionList = <Offer>[].obs;
//   RxList<SettingsList> settingsList = <SettingsList>[].obs;
//   var subscriptionDetails = <Map<String, dynamic>>[].obs;

//   var respCode = 0.obs;

//   void handleSubmit(String phoneNumber) async {
//     isLoading.value = true;

//     isSubmitted.value = true;
//     mobileNumber.value = phoneNumber;

//     GetSubscriptionModel getSubscriptionModel =
//         await getSubscriptionDetailApi(phoneNumber);
//     ListSettingModel listSettingData = await listSettingApi(phoneNumber);

//     settingsList.value = listSettingData.settingsList ?? [];
//     subscriptionList.value = getSubscriptionModel.offers?.map((offer) {
//           offer.expiryDate = _formatDate(offer.expiryDate);
//           offer.chargedDate = _formatDate(offer.chargedDate);
//           return offer;
//         })?.toList() ??
//         [];
// print("Updated respCode: ${respCode.value}");

//     isLoading.value = false;
//     respCode.value = listSettingData.respCode ?? 0;


//     if (listSettingData.respCode == 0) {
//       isSubmitted.value = true;
//     }
//   }

//   String _formatDate(String? date) {
//     if (date == null || date.isEmpty) return "";

//     DateTime parsedDate = DateTime.parse(date);
//     String day = DateFormat('d').format(parsedDate);
//     String month = DateFormat('MMM').format(parsedDate);
//     String year = DateFormat('yyyy').format(parsedDate);

//     String dayWithSuffix = _getDayWithSuffix(int.parse(day));

//     return '$dayWithSuffix $month $year';
//   }

//   String _getDayWithSuffix(int day) {
//     if (day >= 11 && day <= 13) {
//       return '${day}th';
//     }
//     switch (day % 10) {
//       case 1:
//         return '${day}st';
//       case 2:
//         return '${day}nd';
//       case 3:
//         return '${day}rd';
//       default:
//         return '${day}th';
//     }
//   }
// }

























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




  //  void toggleSubscriptionStatus(int index) {
  //   String? currentStatus = settingsList[index].status;
  //   settingsList[index].status = (currentStatus == "A") ? "S" : "A";
  //   settingsList.refresh(); 
  // }