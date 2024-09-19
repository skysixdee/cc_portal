import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/search_tone_model.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<SearchToneModel> searchToneApi(String text, String category,
    {int pageNo = 0}) async {
  ActivateTuneController con = Get.find();
  List<String> idlst = ["!$category"];
  List<String> searchKey = ["$text"];
  Map<String, dynamic> myPost = {
    "sortBy": "OrderBy",
    "pageNo": pageNo,
    "perPageCount": pagePerCount,
    "filter": "Content",
    "filterPref": "custom",
    "locale": con.isEnglish.value
        ? StoreManager().enLanguageSort
        : StoreManager().otherLanguageSort,
    "msisdn": "",
    "searchKey": searchKey,
    "categoryId": idlst,
  };

  Map<String, dynamic> map =
      await NetworkManager().postResquest(advanceSearchToneUrl, myPost);
  print("SKY shiv====== ${map}");
  //await Future.delayed(Duration(seconds: 2));
  return searchToneModelFromJson(json.encode(map));
  //post(advanceSearchToneUrl, null, jsonData: myPost);
}
