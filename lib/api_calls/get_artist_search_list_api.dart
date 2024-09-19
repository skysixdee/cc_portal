import 'dart:convert';

import 'package:sm_admin_portal/Models/artist_searched_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<ArtistSearchModel> getArtistSearchListApi(String text,
    {int pageNo = 0}) async {
  Map<String, dynamic> map = {
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Artist",
    "filterPref": "begin",
    "locale": StoreManager().languageSort,
    "searchKey": [text]
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(advanceArtistSearchUrl, map);
  return artistSearchModelFromJson(json.encode(jsonResp));
  //return artistSearchModelFromJson(_json);
}
