import 'dart:convert';
import 'package:get/get.dart';
import 'package:cc_portal/Models/artists_tune_model.dart';
import 'package:cc_portal/controllers/activate_tune_controller.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/get_transaction_id.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<ArtistsToneModel> artistTuneSearchApi(String searchKey,
    {int pageNo = 0}) async {
  String url = advanceArtistTuneSearchUrl;
  ActivateTuneController con = Get.find();
  Map<String, dynamic> myPost = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Artist",
    "filterPref": "custom",
    "locale": con.isEnglish.value
        ? StoreManager().enLanguageSort
        : StoreManager().otherLanguageSort,
    "searchKey": [searchKey],
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(url, myPost);
  return artistsToneModelFromJson(json.encode(jsonResp));
}
