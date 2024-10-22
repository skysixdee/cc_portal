import 'dart:convert';

import 'package:cc_portal/Models/offer_list_model.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/get_transaction_id.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<OfferListModel> listOfferApi() async {
  Map<String, dynamic> myPost = {
    "transactionId": getTransactionId(),
    "featureId": 1,
    "channelId": channelId,
    "languageCode": StoreManager().languageSort,
    "offerType": '1',
  };
  try {
    Map<String, dynamic> map =
        await NetworkManager().postResquest(listOfferUrl, myPost);

    return offerListModelFromJson(json.encode(map));
  } catch (e) {
    print("error is ${e}");
    return OfferListModel();
  }
}
