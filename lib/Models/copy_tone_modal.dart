import 'dart:convert';

import 'package:get/get.dart';

CopyToneDetailModal toneDetailModalFromJson(String str) =>
    CopyToneDetailModal.fromJson(json.decode(str));

String toneDetailModalToJson(CopyToneDetailModal data) =>
    json.encode(data.toJson());

class CopyToneDetailModal {
  int? respCode;
  String? message;
  List<CTonelist>? copytonelist;

  CopyToneDetailModal({
    this.respCode,
    this.message,
    this.copytonelist,
  });

  factory CopyToneDetailModal.fromJson(Map<String, dynamic> json) =>
      CopyToneDetailModal(
        respCode: json["respCode"],
        message: json["message"],
        copytonelist: json["tonelist"] == null
            ? []
            : List<CTonelist>.from(
                json["tonelist"]!.map((x) => CTonelist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "tonelist": copytonelist == null
            ? []
            : List<dynamic>.from(copytonelist!.map((x) => x.toJson())),
      };
}

class CTonelist {
  String? id;
  String? msisdn;
  String? subscriptionCode;
  String? toneStatus;
  String? activationDate;
  String? toneNextBillingDate;
  String? offerCode;
  String? cpId;
  String? cpName;
  String? activationType;
  String? toneId;
  String? language;
  String? toneName;
  String? channelId;
  //RxBool? isSuspend = true.obs;
  CTonelist({
    this.id,
    this.msisdn,
    this.subscriptionCode,
    this.toneStatus,
    this.activationDate,
    this.toneNextBillingDate,
    this.offerCode,
    this.cpId,
    this.cpName,
    this.activationType,
    this.toneId,
    this.language,
    this.toneName,
    this.channelId,

  });

  //           "id": "2194854",
  //           "msisdn": "832008988",
  //           "subscriptionCode": "832008988",
  //           "toneStatus": "A",
  //           "activationDate": "2024-02-21 12:42:04",
  //           "toneNextBillingDate": "2024-03-21",
  //           "offerCode": "CRBT",
  //           "cpId": "601902",
  //           "cpName": "Ziiki Majors",
  //           "activationType": "FREE",
  //           "toneId": "601902000000014504",
  //           "language": "ENGLISH",
  //           "toneName": "Gods Plan",
  //           "channelId": "USSD"

  factory CTonelist.fromJson(Map<String, dynamic> json) => CTonelist(
        id: json["id"],
        msisdn: json["msisdn"],
        subscriptionCode: json["subscriptionCode"],
        toneStatus: json["toneStatus"],
        activationDate: json["activationDate"],
        toneNextBillingDate: json["toneNextBillingDate"],
        offerCode: json["offerCode"],
        cpId: json["cpId"],
        cpName: json["cpName"],
        activationType: json["activationType"],
        toneId: json["toneId"],
        language: json["language"],
        toneName: json["toneName"],
        channelId: json["channelId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "msisdn": msisdn,
        "subscriptionCode": subscriptionCode,
        "toneStatus": toneStatus,
        "activationDate": activationDate,
        "toneNextBillingDate": toneNextBillingDate,
        "offerCode": offerCode,
        "cpId": cpId,
        "cpName": cpName,
        "activationType": activationType,
        "toneId": toneId,
      };
}
