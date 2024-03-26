// To parse this JSON data, do
//
//     final historySubscriptionModel = historySubscriptionModelFromJson(jsonString);

import 'dart:convert';

HistorySubscriptionModel historySubscriptionModelFromJson(String str) =>
    HistorySubscriptionModel.fromJson(json.decode(str));

String historySubscriptionModelToJson(HistorySubscriptionModel data) =>
    json.encode(data.toJson());

class HistorySubscriptionModel {
  List<SubscriptionInfo>? data;

  HistorySubscriptionModel({
    this.data,
  });

  factory HistorySubscriptionModel.fromJson(Map<String, dynamic> json) =>
      HistorySubscriptionModel(
        data: json["data"] == null
            ? []
            : List<SubscriptionInfo>.from(
                json["data"]!.map((x) => SubscriptionInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubscriptionInfo {
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

  SubscriptionInfo({
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

  factory SubscriptionInfo.fromJson(Map<String, dynamic> json) =>
      SubscriptionInfo(
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
