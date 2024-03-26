// To parse this JSON data, do
//
//     final historyPurchaseModel = historyPurchaseModelFromJson(jsonString);

import 'dart:convert';

HistoryPurchaseModel historyPurchaseModelFromJson(String str) =>
    HistoryPurchaseModel.fromJson(json.decode(str));

String historyPurchaseModelToJson(HistoryPurchaseModel data) =>
    json.encode(data.toJson());

class HistoryPurchaseModel {
  String? total;
  List<PurchaseInfo>? data;

  HistoryPurchaseModel({
    this.total,
    this.data,
  });

  factory HistoryPurchaseModel.fromJson(Map<String, dynamic> json) =>
      HistoryPurchaseModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<PurchaseInfo>.from(
                json["data"]!.map((x) => PurchaseInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PurchaseInfo {
  String? aParty;
  String? bParty;
  String? englishToneName;
  String? nextBillingDate;
  String? callCharge;
  String? channel;
  String? subscriptionDate;
  String? basicCause;
  String? toneType;
  String? transactionType;

  PurchaseInfo({
    this.aParty,
    this.bParty,
    this.englishToneName,
    this.nextBillingDate,
    this.callCharge,
    this.channel,
    this.subscriptionDate,
    this.basicCause,
    this.toneType,
    this.transactionType,
  });

  factory PurchaseInfo.fromJson(Map<String, dynamic> json) => PurchaseInfo(
        aParty: json["AParty"],
        bParty: json["BParty"],
        englishToneName: json["EnglishToneName"],
        nextBillingDate: json["NextBillingDate"],
        callCharge: json["CallCharge"],
        channel: json["Channel"],
        subscriptionDate: json["SubscriptionDate"],
        basicCause: json["BasicCause"],
        toneType: json["ToneType"],
        transactionType: json["TransactionType"],
      );

  Map<String, dynamic> toJson() => {
        "AParty": aParty,
        "BParty": bParty,
        "EnglishToneName": englishToneName,
        "NextBillingDate": nextBillingDate,
        "CallCharge": callCharge,
        "Channel": channel,
        "SubscriptionDate": subscriptionDate,
        "BasicCause": basicCause,
        "ToneType": toneType,
        "TransactionType": transactionType,
      };
}
