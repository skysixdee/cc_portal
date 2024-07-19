
// import 'package:sm_admin_portal/Models/subscribers_modal.dart';
// import 'package:sm_admin_portal/network_manager/network_manager.dart';

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



import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';

import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<GenericModal> BuyTone() async {
  String url =
      ' http://10.0.10.33:5679/selfcare/subscriber-management/buy-tone';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {
    
    "transactionId":"123456789",
    "featureId":1,
    "msisdn":"92000007",
    "offerCode":"CRBT_MONTHLY_REC",
    "contentId":"789012",
    "contentType":2,
    "languageCode":"en",
    "channelId":1,
    "userData":"user data"

};
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap = 
      await NetworkManager().postResquest(url, jsonData);
  GenericModal modal = GenericModal.fromJson(jsonMap);
  print("modal =${modal.message}");
  //print("modal Offers=${modal.offers?.length}");
  print("modal  respCode =${modal.respCode}");
  return modal;
  //createRowList(modal.offers, phoneNumber);
}
