// To parse this JSON data, do
//
//     final historyAllModel = historyAllModelFromJson(jsonString);

import 'dart:convert';

HistoryAllModel historyAllModelFromJson(String str) =>
    HistoryAllModel.fromJson(json.decode(str));

String historyAllModelToJson(HistoryAllModel data) =>
    json.encode(data.toJson());

class HistoryAllModel {
  String? total;
  List<AllInfo>? data;

  HistoryAllModel({
    this.total,
    this.data,
  });

  factory HistoryAllModel.fromJson(Map<String, dynamic> json) =>
      HistoryAllModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<AllInfo>.from(json["data"]!.map((x) => AllInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AllInfo {
  String? aParty;
  String? bParty;
  String? englishToneName;
  String? nextBillingDate;
  String? callCharge;
  String? channel;
  String? deactivationDate;
  String? subscriptionDate;
  String? toneType;
  String? transactionType;

  AllInfo({
    this.aParty,
    this.bParty,
    this.englishToneName,
    this.nextBillingDate,
    this.callCharge,
    this.channel,
    this.deactivationDate,
    this.subscriptionDate,
    this.toneType,
    this.transactionType,
  });

  factory AllInfo.fromJson(Map<String, dynamic> json) => AllInfo(
        aParty: json["AParty"],
        bParty: json["BParty"],
        englishToneName: json["EnglishToneName"],
        nextBillingDate: json["NextBillingDate"],
        callCharge: json["CallCharge"],
        channel: json["Channel"],
        deactivationDate: json["DeactivationDate"],
        subscriptionDate: json["SubscriptionDate"],
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
        "DeactivationDate": deactivationDate,
        "SubscriptionDate": subscriptionDate,
        "ToneType": toneType,
        "TransactionType": transactionType,
      };
}
