import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/get_transaction_id.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<ArtistsToneModel> searchToneIdApi(String toneId) async {
  String url = advanceToneIdSearchUrl;
  ActivateTuneController con = Get.find();
  Map<String, dynamic> myPost = {
    "transactionId": getTransactionId(),
    "channelId": channelId,
    "sortBy": "OrderBy",
    "pageNo": "0",
    "perPageCount": pagePerCount,
    "filter": "ToneId",
    "filterPref": "begin",
    "locale": con.isEnglish.value
        ? StoreManager().enLanguageSort
        : StoreManager().otherLanguageSort,
    "searchKey": [toneId],
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(url, myPost);
  return artistsToneModelFromJson(json.encode(jsonResp));
}
