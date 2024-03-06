import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';

Future<SubscribersModal> getPackDetailApi(String phoneNumber) async {
  String url =
      'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {"msisdn": phoneNumber};
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
  print("modal =${modal.message}");
  print("modal Offers=${modal.offers?.length}");
  print("modal  respCode =${modal.respCode}");
  return modal;
  //createRowList(modal.offers, phoneNumber);
}
