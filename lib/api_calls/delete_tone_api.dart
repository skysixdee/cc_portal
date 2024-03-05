//import 'package:sm_admin_portal/Models/Generic_Tone_modal.dart';
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deleteToneApi() async {
  String url = deletetoneurl;

  Map<String, dynamic> jsondata = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "contentId": "",
    "channelId": "",
  };
  Map<String, dynamic> jsonrequ =
      await NetworkManager().postResquest(url, jsondata);
  GenericModal modal = GenericModal.fromJson(jsonrequ);
  return modal;
}