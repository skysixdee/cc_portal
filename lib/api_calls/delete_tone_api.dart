// //import 'package:sm_admin_portal/Models/Generic_Tone_modal.dart';
// import 'dart:convert';

//   ;

// Future<GenericModal> deleteToneApi() async {
//   String url =" http://10.0.10.33:5679/selfcare/subscriber-management/delete-tone";

//   Map<String, dynamic> jsondata = {

//   "transactionId": "9234567822",
//   "featureId": 1,
//   "msisdn": "92000002",
//   "contentId": "1157833",
//   "channelId": 2 ,
//   "offerCode":"CRBT_MONTHLY_REC"

// };
//   // Map<String, dynamic> jsonrequ =
//   //     await NetworkManager().postResquest(url, jsondata);             server
//   Map<String, dynamic> jsonrequ = json.decode(responString);
//   await Future.delayed(Duration(seconds: 3));
//   GenericModal modal = GenericModal.fromJson(jsonrequ);
//   return modal;
// }

// String responString = """{
// "respCode" : 0,
//  "message" : "successful"
// }
// """;

import 'package:sm_admin_portal/Models/generic_modal.dart';

import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deleteToneApi(String toneId, String offerStatus) async {
  String url = deleteToneUrl;

  Map<String, dynamic> jsonData =
      // {
      //   "transactionId": getTransactionId(),
      //   "featureId": 1,
      //   "msisdn": StoreManager().customerNumber,
      //   "contentId": toneId,
      //   "channelId": 2,
      //   "offerCode": offerStatus
      // };
      {
    "transactionId": "9234567822",
    "featureId": 1,
    "msisdn": "92000002",
    "contentId": "1157833",
    "channelId": 2,
    "offerCode": "CRBT_MONTHLY_REC"
  };

  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  GenericModal modal = GenericModal.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}
