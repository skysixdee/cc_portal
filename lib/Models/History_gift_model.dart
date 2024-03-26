// To parse this JSON data, do
//
//     final historyGiftModel = historyGiftModelFromJson(jsonString);

import 'dart:convert';

HistoryGiftModel historyGiftModelFromJson(String str) =>
    HistoryGiftModel.fromJson(json.decode(str));

String historyGiftModelToJson(HistoryGiftModel data) =>
    json.encode(data.toJson());

class HistoryGiftModel {
  String? total;
  List<Datum>? data;

  HistoryGiftModel({
    this.total,
    this.data,
  });

  factory HistoryGiftModel.fromJson(Map<String, dynamic> json) =>
      HistoryGiftModel(
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? deactivationDate;
  String? subscriptionDate;
  String? aParty;
  String? toneId;
  String? englishToneName;
  String? callCharge;
  String? basicCause;

  Datum({
    this.deactivationDate,
    this.subscriptionDate,
    this.aParty,
    this.toneId,
    this.englishToneName,
    this.callCharge,
    this.basicCause,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        deactivationDate: json["DeactivationDate"],
        subscriptionDate: json["SubscriptionDate"],
        aParty: json["AParty"],
        toneId: json["ToneId"],
        englishToneName: json["EnglishToneName"],
        callCharge: json["CallCharge"],
        basicCause: json["BasicCause"],
      );

  Map<String, dynamic> toJson() => {
        "DeactivationDate": deactivationDate,
        "SubscriptionDate": subscriptionDate,
        "AParty": aParty,
        "ToneId": toneId,
        "EnglishToneName": englishToneName,
        "CallCharge": callCharge,
        "BasicCause": basicCause,
      };
}
