// To parse this JSON data, do
//
//     final offerListModel = offerListModelFromJson(jsonString);

import 'dart:convert';

OfferListModel offerListModelFromJson(String str) =>
    OfferListModel.fromJson(json.decode(str));

String offerListModelToJson(OfferListModel data) => json.encode(data.toJson());

class OfferListModel {
  int? respCode;
  String? message;
  List<OfferList>? offerList;

  OfferListModel({
    this.respCode,
    this.message,
    this.offerList,
  });

  factory OfferListModel.fromJson(Map<String, dynamic> json) => OfferListModel(
        respCode: json["respCode"],
        message: json["message"],
        offerList: json["offerList"] == null
            ? []
            : List<OfferList>.from(
                json["offerList"]!.map((x) => OfferList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "offerList": offerList == null
            ? []
            : List<dynamic>.from(offerList!.map((x) => x.toJson())),
      };
}

class OfferList {
  String? offerId;
  String? offerName;
  String? offerMarketingName;
  String? validity;
  String? pricePoint;

  OfferList({
    this.offerId,
    this.offerName,
    this.offerMarketingName,
    this.validity,
    this.pricePoint,
  });

  factory OfferList.fromJson(Map<String, dynamic> json) => OfferList(
        offerId: json["offerId"],
        offerName: json["offerName"],
        offerMarketingName: json["offerMarketingName"],
        validity: "${json["validity"] ?? json["Validity"]}",
        pricePoint: "${json["pricePoint"]}",
      );

  Map<String, dynamic> toJson() => {
        "offerId": offerId,
        "offerName": offerName,
        "offerMarketingName": offerMarketingName,
        "validity": validity,
        "pricePoint": pricePoint,
      };
}
