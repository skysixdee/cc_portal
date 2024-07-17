//import 'package:sm_admin_portal/Models/Generic_Tone_modal.dart';
import 'dart:convert';

import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deleteToneApi() async {
  String url =" http://10.0.10.33:5679/selfcare/subscriber-management/delete-tone";

  Map<String, dynamic> jsondata = {
  "transactionId": "9234567822",
  "featureId": 1,
  "msisdn": "92000002",
  "contentId": "1157833",
  "channelId": 2 ,
  "offerCode":"CRBT_MONTHLY_REC"
};
  // Map<String, dynamic> jsonrequ =
  //     await NetworkManager().postResquest(url, jsondata);             server
  Map<String, dynamic> jsonrequ = json.decode(responString);
  await Future.delayed(Duration(seconds: 3));
  GenericModal modal = GenericModal.fromJson(jsonrequ);
  return modal;
}

String responString = """{
"respCode" : 0,
 "message" : "successful"
}
""";
