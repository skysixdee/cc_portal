// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  List<HistoryInfo>? data;
  String? count;
  String? statusCode;

  HistoryModel({
    this.data,
    this.count,
    this.statusCode,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        data: json["data"] == null
            ? []
            : List<HistoryInfo>.from(
                json["data"]!.map((x) => HistoryInfo.fromJson(x))),
        count: json["count"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "count": count,
        "statusCode": statusCode,
      };
}

class HistoryInfo {
  String? aParty;
  String? bParty;
  String? nextBillingDate;
  String? channel;
  String? deactivationDate;
  String? englishToneName;
  String? transactionType;
  String? timeStamp;
  String? callCharge;
  String? validityDays;
  String? basicCause;
  String? offerName;

  HistoryInfo({
    this.aParty,
    this.bParty,
    this.nextBillingDate,
    this.channel,
    this.deactivationDate,
    this.englishToneName,
    this.transactionType,
    this.timeStamp,
    this.callCharge,
    this.validityDays,
    this.basicCause,
    this.offerName,
  });

  factory HistoryInfo.fromJson(Map<String, dynamic> json) => HistoryInfo(
        aParty: json["AParty"],
        bParty: json["BParty"],
        nextBillingDate: json["NextBillingDate"],
        channel: json["Channel"],
        deactivationDate: json["DeactivationDate"],
        englishToneName: json["EnglishToneName"],
        transactionType: json["TransactionType"],
        timeStamp: json["TimeStamp"],
        callCharge: json["CallCharge"],
        validityDays: json["ValidityDays"],
        basicCause: json["BasicCause"],
        offerName: json["offerName"],
      );

  Map<String, dynamic> toJson() => {
        "AParty": aParty,
        "BParty": bParty,
        "NextBillingDate": nextBillingDate,
        "Channel": channel,
        "DeactivationDate": deactivationDate,
        "EnglishToneName": englishToneName,
        "TransactionType": transactionType,
        "TimeStamp": timeStamp,
        "CallCharge": callCharge,
        "ValidityDays": validityDays,
        "BasicCause": basicCause,
        "offerName": offerName,
      };
}
