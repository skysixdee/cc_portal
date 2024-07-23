import 'dart:convert';

import 'package:sm_admin_portal/Models/search_tone_model.dart';
import 'package:sm_admin_portal/utilily/urls.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<SearchToneModel> searchToneApi(String text, String category,
    {int pageNo = 0}) async {
  List<String> idlst = ["!$category"];
  List<String> searchKey = ["$text"];
  Map<String, dynamic> myPost = {
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Content",
    "filterPref": "custom",
    "locale": "en",
    "msisdn": "",
    "searchKey": searchKey,
    "categoryId": idlst,
  };

  Map<String, dynamic> map =
      await NetworkManager().postResquest(advanceSearchToneUrl, myPost);
  print("SKY shiv====== ${map}");
  return searchToneModelFromJson(json.encode(map));
  //post(advanceSearchToneUrl, null, jsonData: myPost);
}
