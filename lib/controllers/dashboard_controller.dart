import 'package:get/get.dart';
import 'package:sm_admin_portal/api_calls/buy_tone_api.dart';
import 'package:sm_admin_portal/api_calls/delete_tone_api.dart';
import 'package:sm_admin_portal/api_calls/get_subscription_detail_api.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tune_list_api.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class DashboardController extends GetxController {
  var isLoading = false.obs;
  var isSubmitted = false.obs;
  var mobileNumber = ''.obs;
  var phoneNumber = ''.obs;
  // var contentId = '';

  void handleSubmit(String phonenumber) {
    //   getSubscriptionDetailApi();
    getSubscriptionDetailApi(phonenumber);
    deleteToneApi();
    BuyTone();
    //listSettingApi();
    // toneListApi();
    // listSettingApi();
    // toneListApi();
    //getToneDetailApi();
    //listSettingApi(phonenumber);
    if (phonenumber.length == 10) {
      isLoading.value = true;

      Future.delayed(Duration(seconds: 1), () {
        isLoading.value = false;
        isSubmitted.value = true;
        mobileNumber.value = phonenumber;
      });
    }
    // else {
    //   Get.snackbar(
    //     'Error',
    //     'Please enter a valid 10-digit mobile number',
    //     snackPosition: SnackPosition.BOTTOM,
    //   );
    // }
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DashboardController extends GetxController {
//   var isLoading = false.obs;
//   var isSubmitted = false.obs;
//   var mobileNumber = ''.obs;
//   var subscriptionDetails = <Map<String, dynamic>>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize subscription details
//     subscriptionDetails.value = [
//       {
//         'subscription': 'Subscription:',
//         'status': 'ACTIVE',
//         'statusColor': Colors.green,
//         'details': 'CRBT Daily – Rs 7/Day',
//         'buttonText': 'Deactivate',
//       },
//       {
//         'subscription': 'Temp Status:',
//         'status': 'ACTIVE',
//         'statusColor': Colors.green,
//         'details': '',
//         'buttonText': 'Suspend Service',
//       },
//       {
//         'subscription': 'Last Renewed on',
//         'status': '',
//         'statusColor': null,
//         'details': '6th June 2024',
//         'buttonText': '',
//       },
//       {
//         'subscription': 'Next Renewal Date',
//         'status': '',
//         'statusColor': null,
//         'details': '7th June 2024',
//         'buttonText': '',
//       },
//     ];
//   }

//   void handleSubmit(String number) {
//     // Handle submit logic here
//     mobileNumber.value = number;
//     isSubmitted.value = true;
//   }

//   void toggleSubscriptionStatus( index) {
//     if (subscriptionDetails[index]['buttonText'] == 'Suspend Service') {
//       subscriptionDetails[index]['status'] = 'SUSPEND';
//       subscriptionDetails[index]['buttonText'] = 'Resume Service';
//       subscriptionDetails[index]['statusColor'] = Colors.brown;
//     } else if (subscriptionDetails[index]['buttonText'] == 'Resume Service') {
//       subscriptionDetails[index]['status'] = 'ACTIVE';
//       subscriptionDetails[index]['buttonText'] = 'Suspend Service';
//       subscriptionDetails[index]['statusColor'] = Colors.green;
//     }
//     subscriptionDetails.refresh(); // Update the UI
//   }
// }