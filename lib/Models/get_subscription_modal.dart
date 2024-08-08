// To parse this JSON data, do
//
//     final getSubscriptionModel = getSubscriptionModelFromJson(jsonString);

import 'dart:convert';

GetSubscriptionModel getSubscriptionModelFromJson(String str) =>
    GetSubscriptionModel.fromJson(json.decode(str));

String getSubscriptionModelToJson(GetSubscriptionModel data) =>
    json.encode(data.toJson());

class GetSubscriptionModel {
  String? msisdn;
  int? respCode;
  String? message;
  List<Offer>? offers;

  GetSubscriptionModel({
    this.msisdn,
    this.respCode,
    this.message,
    this.offers,
  });

  factory GetSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      GetSubscriptionModel(
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

class Offer {
  String? offerName;
  String? offerStatus;
  String? expiryDate;
  String? chargedAmount;
  String? chargedDate;
  String? chargedValidity;
  String? firstActivationDate;
  String? activationChannel;
  String? deactivationDate;
  String? deactivationChannel;

  Offer({
    this.offerName,
    this.offerStatus,
    this.expiryDate,
    this.chargedAmount,
    this.chargedDate,
    this.chargedValidity,
    this.firstActivationDate,
    this.activationChannel,
    this.deactivationDate,
    this.deactivationChannel,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerName: json["offerName"],
        offerStatus: json["offerStatus"],
        expiryDate: json["expiryDate"],
        chargedAmount: json["chargedAmount"],
        chargedDate: json["chargedDate"],
        chargedValidity: json["chargedValidity"],
        firstActivationDate: json["firstActivationDate"],
        activationChannel: json["activationChannel"],
        deactivationDate: json["deactivationDate"],
        deactivationChannel: json["deactivationChannel"],
      );

  get respCode => null;

  Map<String, dynamic> toJson() => {
        "offerName": offerName,
        "offerStatus": offerStatus,
        "expiryDate": expiryDate,
        "chargedAmount": chargedAmount,
        "chargedDate": chargedDate,
        "chargedValidity": chargedValidity,
        "firstActivationDate": firstActivationDate,
        "activationChannel": activationChannel,
        "deactivationDate": deactivationDate,
        "deactivationChannel": deactivationChannel,
      };
}
