// To parse this JSON data, do
//
//     final historyRenewalModel = historyRenewalModelFromJson(jsonString);

import 'dart:convert';

HistoryRenewalModel historyRenewalModelFromJson(String str) =>
    HistoryRenewalModel.fromJson(json.decode(str));

String historyRenewalModelToJson(HistoryRenewalModel data) =>
    json.encode(data.toJson());

class HistoryRenewalModel {
  String? total;
  List<RenewalInfo>? data;

  HistoryRenewalModel({
    this.total,
    this.data,
  });

  factory HistoryRenewalModel.fromJson(Map<String, dynamic> json) =>
      HistoryRenewalModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<RenewalInfo>.from(
                json["data"]!.map((x) => RenewalInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RenewalInfo {
  String? deactivationDate;
  String? subscriptionDate;
  String? aParty;
  String? offerCode;
  String? lastChargedDeductionDate;
  String? nextBillingDate;
  String? channel;
  String? toneId;
  String? englishToneName;
  String? callCharge;
  String? transactionType;

  RenewalInfo({
    this.deactivationDate,
    this.subscriptionDate,
    this.aParty,
    this.offerCode,
    this.lastChargedDeductionDate,
    this.nextBillingDate,
    this.channel,
    this.toneId,
    this.englishToneName,
    this.callCharge,
    this.transactionType,
  });

  factory RenewalInfo.fromJson(Map<String, dynamic> json) => RenewalInfo(
        deactivationDate: json["DeactivationDate"],
        subscriptionDate: json["SubscriptionDate"],
        aParty: json["AParty"],
        offerCode: json["OfferCode"],
        lastChargedDeductionDate: json["LastChargedDeductionDate"],
        nextBillingDate: json["NextBillingDate"],
        channel: json["Channel"],
        toneId: json["ToneId"],
        englishToneName: json["EnglishToneName"],
        callCharge: json["CallCharge"],
        transactionType: json["TransactionType"],
      );

  Map<String, dynamic> toJson() => {
        "DeactivationDate": deactivationDate,
        "SubscriptionDate": subscriptionDate,
        "AParty": aParty,
        "OfferCode": offerCode,
        "LastChargedDeductionDate": lastChargedDeductionDate,
        "NextBillingDate": nextBillingDate,
        "Channel": channel,
        "ToneId": toneId,
        "EnglishToneName": englishToneName,
        "CallCharge": callCharge,
        "TransactionType": transactionType,
      };
}
