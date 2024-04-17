//import 'package:sm_admin_portal/Models/Generic_Tone_modal.dart';
import 'dart:convert';

import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deleteToneApi(String contentId) async {
  String url = deletetoneurl;

  Map<String, dynamic> jsondata = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "contentId": contentId,
    "channelId": "",
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
