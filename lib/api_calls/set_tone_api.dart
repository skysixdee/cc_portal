import 'dart:convert';

import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> setToneApi(String offerCode, String toneId) async {
  Map<String, dynamic> map = {
    "transactionId": getTransactionId(),
    "featureId": "1",
    "msisdn": StoreManager().msisdn,
    "offerCode": offerCode,
    "contentId": toneId,
    "contentType": "1",
    "languageCode": StoreManager().languageCode,
    "channelId": channelId,
  };
  Map<String, dynamic> jsonData =
      await NetworkManager().postResquest(setToneUrl, map);
  return genericModalFromJson(json.encode(jsonData));
}
