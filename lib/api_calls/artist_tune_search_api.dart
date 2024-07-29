import 'dart:convert';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<ArtistsToneModel> artistTuneSearchApi(String searchKey,
    {int pageNo = 0}) async {
  String url = advanceArtistTuneSearchUrl;

  Map<String, dynamic> myPost = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Artist",
    "filterPref": "custom",
    "locale": "en",
    "searchKey": [searchKey],
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(url, myPost);
  return artistsToneModelFromJson(json.encode(jsonResp));
}
