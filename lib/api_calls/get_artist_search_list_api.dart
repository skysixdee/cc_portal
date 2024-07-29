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
    "locale": StoreManager().languageCode,
    "searchKey": [text]
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(advanceArtistSearchUrl, map);
  return artistSearchModelFromJson(_json);
}

String _json = """{
    "message": "Success",
    "respTime": "Response Time",
    "statusCode": "SC0000",
    "responseMap": {
        "artistList": [
            {
                "val": "ZA YAN DA",
                "count": 55
            },
            {
                "val": "SLO9E KOROAR PGB",
                "count": 2
            },
            {
                "val": "CHAN MYAE AUNG + TAY ZA MC",
                "count": 1
            },
            {
                "val": "KHET SID",
                "count": 1
            },
            {
                "val": "Than Myat Soe",
                "count": 1
            }
        ]
    }
}""";
