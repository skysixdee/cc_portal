import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/list_settin_modal.dart';
import 'package:sm_admin_portal/Models/list_setting_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';

Future<ListSettingModel> listSettingApi(phoneNumber) async {
  String url =
      'http://10.0.14.4:8082/selfcare/subscriber-management/list-settings';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    "featureId": 1,
    "msisdn": phoneNumber,
    "offerCode": "CRBT_WEEKLY",
    "languageCode": "en",
    "channelId": 3,
    "serviceId": "DefaultSettings"
  };
  await Future.delayed(Duration(milliseconds: 20));
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  ListSettingModel modal = ListSettingModel.fromJson(jsonMap);
  print("modal =${modal.message}");

  return modal;
}
