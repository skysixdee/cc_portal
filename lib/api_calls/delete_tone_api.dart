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

Future<GenericModal> deleteToneApi(String? offerStatus) async {
  String url =
      'http://10.0.10.33:5679/selfcare/subscriber-management/delete-tone';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {
    "transactionId": "9234567822",
    "featureId": 1,
    "msisdn": "92000002",
    "contentId": "1157833",
    "channelId": 2,
    "offerCode": "CRBT_MONTHLY_REC"
  };

  //await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  GenericModal modal = GenericModal.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}
 // print("modal Offers=${modal.offers?.length}");
  // print("modal  respCode =${modal.respCode}");
   //createRowList(modal.offers, phoneNumber);