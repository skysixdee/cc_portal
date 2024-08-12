import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> resumeApi(String msisdn) async {
  String resumeUrl = 'http://10.0.10.33:9089/selfcare/subscription/resume';
  Map<String, dynamic> jsonData = {
    "transactionId": "3422",
    "featureId": 1,
    "msisdn": "8182020000",
    "channelId": 2
  };
  // {
  //   "transactionId": getTransactionId(),
  //   "featureId": 1,
  //   "msisdn": msisdn,
  //   "channelId": channelId,
  // };
  Map<String, dynamic> response =
      await NetworkManager().postResquest(resumeUrl, jsonData);
  GenericModal model = GenericModal.fromJson(response);
  print("Model = $model");
  return model;
}
