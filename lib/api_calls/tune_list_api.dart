import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/list_settin_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/tone_list_model.dart';
import 'package:sm_admin_portal/Models/tone_search_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<ToneListModel> toneListApi() async {
  String url =
      'http://10.0.14.4:8082/selfcare/subscriber-management/list-tones';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {
    "transactionId": "655652",
    "featureId": 1,
    "msisdn": "8182010000",
    "languageCode": "en",
    "channelId": 2
  };
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  ToneListModel modal = ToneListModel.fromJson(jsonMap);
  print("modal =${modal.message}");
  // print("modal Offers=${modal.offers?.length}");
  // print("modal  respCode =${modal.respCode}");
  return modal;
  //createRowList(modal.offers, phoneNumber);
}
