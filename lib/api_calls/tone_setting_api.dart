// import 'package:flutter/material.dart';
// import 'package:sm_admin_portal/Models/list_settin_modal.dart';
// import 'package:sm_admin_portal/Models/list_setting_modal.dart';
// import 'package:sm_admin_portal/Models/subscribers_modal.dart';
// import 'package:sm_admin_portal/network_manager/network_manager.dart';

// Future<ListSettingModel> listSettingApi() async {
//   String url =
//       'http://10.0.14.4:8082/selfcare/subscriber-management/list-settings';
//   //  jsonData: );;
//   Map<String, dynamic> jsonData = {
//     "transactionId":"64834346535",
//     "featureId":1,
//     "msisdn" : "8182010000",
//     "offerCode":"CRBT_WEEKLY",
//     "languageCode":"en",
//     "channelId":3,
//     "serviceId":"DefaultSettings"
// };
//   await Future.delayed(Duration(seconds: 3));
//   Map<String, dynamic> jsonMap =
//       await NetworkManager().postResquest(url, jsonData);
// ListSettingModel modal =ListSettingModel.fromJson(jsonMap);
//   print("modal =${modal.message}");
//   // print("modal Offers=${modal.offers?.length}");
//   // print("modal  respCode =${modal.respCode}");
//   return modal;
//   //createRowList(modal.offers, phoneNumber);
// }
