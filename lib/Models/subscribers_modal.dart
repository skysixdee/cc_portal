//import'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final subscribersModal = subscribersModalFromJson(jsonString);

import 'dart:convert';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';

SubscribersModal subscribersModalFromJson(String str) =>
    SubscribersModal.fromJson(json.decode(str));

String subscribersModalToJson(SubscribersModal data) =>
    json.encode(data.toJson());

class SubscribersModal {
  String? msisdn;
  int? respCode;
  String? message;
  List<Offer>? offers;

  SubscribersModal({
    this.msisdn,
    this.respCode,
    this.message,
    this.offers,
  });

  factory SubscribersModal.fromJson(Map<String, dynamic> json) =>
      SubscribersModal(
        msisdn: json["msisdn"],
        respCode: json["respCode"],
        message: json["message"],
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msisdn": msisdn,
        "respCode": respCode,
        "message": message,
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}
