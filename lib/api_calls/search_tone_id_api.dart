import 'dart:convert';

import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<ArtistsToneModel> searchToneIdApi(String toneId) async {
  String url = advanceToneIdSearchUrl;
  Map<String, dynamic> myPost = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "sortBy": "OrderBy",
    "pageNo": "0",
    "perPageCount": pagePerCount,
    "filter": "ToneId",
    "filterPref": "begin",
    "locale": "en",
    "searchKey": [toneId],
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(url, myPost);
  return artistsToneModelFromJson(json.encode(jsonResp));
}
