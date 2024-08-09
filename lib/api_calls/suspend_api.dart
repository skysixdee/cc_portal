import 'dart:convert';

import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/screens/suspend_and_resume_screen/widgets/suspend_detail_table.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> suspendApi(String msisdn) async {
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    "featureId": 10,
    "msisdn": msisdn,
    "channelId": "4",
  };
//Map<String, dynamic> response =    await NetworkManager().postResquest(suspendUrl, jsonData);
  Map<String, dynamic> response = json.decode("""{
"respCode" : 0,
 "message" : "successful"
}""");
  await Future.delayed(Duration(seconds: 3));
  GenericModal model = GenericModal.fromJson(response);
  print("Model = $model");

  return model;
}
