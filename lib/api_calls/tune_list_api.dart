import 'package:cc_portal/Models/tone_list_model.dart';

import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/get_transaction_id.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<ToneListModel> toneListApi() async {
  String url = toneListUrl;
  print("making api call sky");
  //  jsonData: );;
  Map<String, dynamic> jsonData = {
    "transactionId": getTransactionId(),
    "featureId": 1,
    "msisdn": StoreManager().customerNumber,
    "languageCode": StoreManager().languageSort,
    "channelId": 2
  };

  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  ToneListModel modal = ToneListModel.fromJson(jsonMap);
  print("modal =${modal.message}");
  return modal;
}
