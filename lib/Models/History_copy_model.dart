// To parse this JSON data, do
//
//     final historyCopyModel = historyCopyModelFromJson(jsonString);

import 'dart:convert';

HistoryCopyModel historyCopyModelFromJson(String str) =>
    HistoryCopyModel.fromJson(json.decode(str));

String historyCopyModelToJson(HistoryCopyModel data) =>
    json.encode(data.toJson());

class HistoryCopyModel {
  String? total;
  List<CopyInfo>? data;

  HistoryCopyModel({
    this.total,
    this.data,
  });

  factory HistoryCopyModel.fromJson(Map<String, dynamic> json) =>
      HistoryCopyModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<CopyInfo>.from(
                json["data"]!.map((x) => CopyInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CopyInfo {
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

  CopyInfo({
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

  factory CopyInfo.fromJson(Map<String, dynamic> json) => CopyInfo(
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
