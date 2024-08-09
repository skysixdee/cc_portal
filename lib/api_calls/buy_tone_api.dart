// // import 'package:sm_admin_portal/Models/subscribers_modal.dart';
// // import 'package:sm_admin_portal/network_manager/network_manager.dart';

// // Future<SubscribersModal> getSubscriptionDetailApi(String phoneNumber) async {
// //   String url =
// //       'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
// //   //  jsonData: );;
// //   Map<String, dynamic> jsonData = {"msisdn": phoneNumber};
// //   await Future.delayed(Duration(seconds: 3));
// //   Map<String, dynamic> jsonMap =
// //       await NetworkManager().postResquest(url, jsonData);
// //   SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
// //   print("modal =${modal.message}");
// //   print("modal Offers=${modal.offers?.length}");
// //   print("modal  respCode =${modal.respCode}");
// //   return modal;
// //   //createRowList(modal.offers, phoneNumber);
// // }

//   ;
// import 'package:sm_admin_portal/Models/get_subscription_modal.dart';

// import 'package:sm_admin_portal/network_manager/network_manager.dart';

// Future<GenericModal> BuyTone() async {
//   String url =
//       ' http://10.0.10.33:5679/selfcare/subscriber-management/buy-tone';
//   //  jsonData: );;
//   Map<String, dynamic> jsonData = {

//     "transactionId":"123456789",
//     "featureId":1,
//     "msisdn":"92000007",
//     "offerCode":"CRBT_MONTHLY_REC",
//     "contentId":"789012",
//     "contentType":2,
//     "languageCode":"en",
//     "channelId":1,
//     "userData":"user data"

// };
//   await Future.delayed(Duration(seconds: 3));
//   Map<String, dynamic> jsonMap =
//       await NetworkManager().postResquest(url, jsonData);
//   GenericModal modal = GenericModal.fromJson(jsonMap);
//   print("modal =${modal.message}");
//   //print("modal Offers=${modal.offers?.length}");
//   print("modal  respCode =${modal.respCode}");
//   return modal;
//   //createRowList(modal.offers, phoneNumber);
// }

import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/list_settin_modal.dart';
import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<ListSettingModel> BuyToneApi(offerstatus) async {
  String url = 'http://10.0.10.33:5679/selfcare/subscriber-management/buy-tone';

  // 'http://10.0.14.4:8082/selfcare/subscriber-management/list-settings';
  //  jsonData: );;
  //await Future.delayed(Duration(seconds: 1));
  Map<String, dynamic> jsonData =
      //{
      // "transactionId": "64834346535",
      // "featureId": 1,
      // "msisdn": "8182010000",
      // "offerCode": "CRBT_WEEKLY",
      // "languageCode": "en",
      // "channelId": 3,
      // "serviceId": "DefaultSettings"
      //};

      {
    "transactionId": "5234908485",
    "featureId": 1,
    "msisdn": "92000003",
    "offerCode": "CRBT_MONTHLY_REC",
    "contentId": "11578321",
    "contentType": 1,
    "languageCode": "en",
    "channelId": 2,
    "userData": "some data"
  };

  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  ListSettingModel modal = ListSettingModel.fromJson(jsonMap);
  print("modal =${modal.message}");
  // print("modal Offers=${modal.offers?.length}");
  // print("modal  respCode =${modal.respCode}");
  return modal;
  //createRowList(modal.offers, phoneNumber);
}
