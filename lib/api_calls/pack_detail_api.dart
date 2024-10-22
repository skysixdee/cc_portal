import 'package:flutter/material.dart';
import 'package:cc_portal/Models/subscribers_modal.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<SubscribersModal> getPackDetailApi(String phoneNumber) async {
  String url = getPackDetailUrl;
  //'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
  //  jsonData: );;
  Map<String, dynamic> jsonData = {"msisdn": phoneNumber};

  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
  print("modal =${modal.message}");
  print("modal Offers=${modal.offers?.length}");
  print("modal  respCode =${modal.respCode}");
  return modal;
  //createRowList(modal.offers, phoneNumber);
}
