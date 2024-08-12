import 'dart:convert';

import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/screens/suspend_and_resume_screen/widgets/suspend_detail_table.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> suspendApi(String msisdn) async {
  String suspendUrl = 'http://10.0.10.33:9089/selfcare/subscription/suspend';
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    "featureId": 1,
    "msisdn": msisdn,
    "channelId": channelId,
  };
  Map<String, dynamic> response =
      await NetworkManager().postResquest(suspendUrl, jsonData);
//   Map<String, dynamic> response = json.decode("""{
// "respCode" : 0,
//  "message" : "successful"
// }""");
//   await Future.delayed(Duration(seconds: 3));
  GenericModal model = GenericModal.fromJson(response);
  print("Model = $model");

  return model;
}
