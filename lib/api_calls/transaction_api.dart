import 'dart:convert';

import 'package:cc_portal/models/history_model.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<HistoryModel> getTransactionApi(String fromDate, String toDate) async {
  Map<String, dynamic> jsonData = {
    "msisdn": '9239198010', //StoreManager().customerNumber, //"9239198010",
    "fromDate": fromDate, //"2024-12-01",
    "toDate": toDate, //"2024-12-20",
    "requestType": "all"
  };
  Map<String, dynamic> jsonReso =
      await NetworkManager().postResquest(transactionHistoryUrl, jsonData);

  HistoryModel model = HistoryModel.fromJson(jsonReso);
  return model;
}
