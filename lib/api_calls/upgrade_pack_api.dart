import 'package:cc_portal/Models/generic_modal.dart';
import 'package:cc_portal/models/get_subscription_modal.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<GenericModal> getupgradeApi() async {
  String url = 'http://demo1908434.mockable.io/upgrade-pack';
  Map<String, dynamic> jsonData = {
    "transactionId": 4564336682,
    "featureId": 1,
    "msisdn": "9239198010",
    "offerCode": 4,
    "channelId": 2
  };
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  GenericModal modal = GenericModal.fromJson(jsonMap);
  return modal;
}
