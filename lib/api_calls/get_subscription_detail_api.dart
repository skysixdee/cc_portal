// import 'package:cc_portal/Models/subscribers_modal.dart';
// import 'package:cc_portal/network_manager/network_manager.dart';

// Future<SubscribersModal> getSubscriptionDetailApi(String phoneNumber) async {
//   String url =
//       'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
//   //  jsonData: );;
//   Map<String, dynamic> jsonData = {"msisdn": phoneNumber};
//   await Future.delayed(Duration(seconds: 3));
//   Map<String, dynamic> jsonMap =
//       await NetworkManager().postResquest(url, jsonData);
//   SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
//   print("modal =${modal.message}");
//   print("modal Offers=${modal.offers?.length}");
//   print("modal  respCode =${modal.respCode}");
//   return modal;
//   //createRowList(modal.offers, phoneNumber);
// }

import 'package:cc_portal/Models/get_subscription_modal.dart';

import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<GetSubscriptionModel> getSubscriptionDetailApi(
    String phoneNumber) async {
  String url = getSubscriptionUrl;
  Map<String, dynamic> jsonData = {"msisdn": phoneNumber};
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  GetSubscriptionModel modal = GetSubscriptionModel.fromJson(jsonMap);

  return modal;
}
