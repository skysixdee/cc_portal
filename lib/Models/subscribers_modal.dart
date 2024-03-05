//import'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final subscribersModal = subscribersModalFromJson(jsonString);

import 'dart:convert';

SubscribersModal subscribersModalFromJson(String str) => SubscribersModal.fromJson(json.decode(str));

String subscribersModalToJson(SubscribersModal data) => json.encode(data.toJson());

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

    factory SubscribersModal.fromJson(Map<String, dynamic> json) => SubscribersModal(
        msisdn: json["msisdn"],
        respCode: json["respCode"],
        message: json["message"],
        offers: json["offers"] == null ? [] : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msisdn": msisdn,
        "respCode": respCode,
        "message": message,
        "offers": offers == null ? [] : List<dynamic>.from(offers!.map((x) => x.toJson())),
    };
}

class Offer {
    String? offerName;
    String? offerStatus;
    String? expiryDate;
    String? chargedAmount;
    String? chargedDate;
    String? chargedValidity;
    String? activationChannel;

    Offer({
        this.offerName,
        this.offerStatus,
        this.expiryDate,
        this.chargedAmount,
        this.chargedDate,
        this.chargedValidity,
        this.activationChannel,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerName: json["offerName"],
        offerStatus: json["offerStatus"],
        expiryDate: json["expiryDate"],
        chargedAmount: json["chargedAmount"],
        chargedDate: json["chargedDate"],
        chargedValidity: json["chargedValidity"],
        activationChannel: json["activationChannel"],
    );

    Map<String, dynamic> toJson() => {
        "offerName": offerName,
        "offerStatus": offerStatus,
        "expiryDate": expiryDate,
        "chargedAmount": chargedAmount,
        "chargedDate": chargedDate,
        "chargedValidity": chargedValidity,
        "activationChannel": activationChannel,
    };
}
