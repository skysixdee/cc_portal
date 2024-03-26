import 'dart:convert';

import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> suspendApi(String msisdn)async{
  Map<String, dynamic> jsonData = {
    "transactionId":"2342342343",
    "featureId":10,
    "msisdn":msisdn,
    "channelId":"4",
  };
//Map<String, dynamic> response =    await NetworkManager().postResquest(suspendUrl, jsonData);
Map<String, dynamic> response = json.decode("""{
"respCode" : 0,
 "message" : "successful"
}""");
await Future.delayed(Duration(seconds: 2));
GenericModal model = GenericModal.fromJson(response);
print("Model = $model");
return model;
}

