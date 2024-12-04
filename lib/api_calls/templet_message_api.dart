import 'package:cc_portal/models/templet_message_model.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<TempletMessageModel> templetMessageApi(String templetId) async {
  Map<String, dynamic> jsonData = {
    "templateId": templetId,
    "languageCode": StoreManager().languageSort
  };
  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(templetMessageUrl, jsonData);
  TempletMessageModel model = TempletMessageModel.fromJson(jsonResp);
  return model;
}
