import 'dart:convert';

import 'package:cc_portal/Models/generic_modal.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/get_transaction_id.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<GenericModal> setToneApi(String offerCode, String toneId) async {
  Map<String, dynamic> map = {
    "transactionId": getTransactionId(),
    "featureId": "1",
    "msisdn": StoreManager().customerNumber,
    "offerCode": offerCode,
    "contentId": toneId,
    "contentType": "1",
    "languageCode": StoreManager().languageSort,
    "channelId": channelId
  };
  Map<String, dynamic> jsonData =
      await NetworkManager().postResquest(setToneUrl, map);

  return genericModalFromJson(json.encode(jsonData));
}
