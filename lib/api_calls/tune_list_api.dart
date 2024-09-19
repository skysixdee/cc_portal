import 'package:sm_admin_portal/Models/tone_list_model.dart';

import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

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
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  ToneListModel modal = ToneListModel.fromJson(jsonMap);
  print("modal =${modal.message}");
  return modal;
}
