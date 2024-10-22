// To parse this JSON data, do
//
//     final toneListModel = toneListModelFromJson(jsonString);

import 'dart:convert';

import 'package:cc_portal/Models/tone_detail_modal.dart';

ToneListModel toneListModelFromJson(String str) =>
    ToneListModel.fromJson(json.decode(str));

String toneListModelToJson(ToneListModel data) => json.encode(data.toJson());

class ToneListModel {
  int? respCode;
  String? message;
  List<Tonelist>? tonelist;

  ToneListModel({
    this.respCode,
    this.message,
    this.tonelist,
  });

  factory ToneListModel.fromJson(Map<String, dynamic> json) => ToneListModel(
        respCode: json["respCode"],
        message: json["message"],
        tonelist: json["tonelist"] == null
            ? []
            : List<Tonelist>.from(
                json["tonelist"]!.map((x) => Tonelist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "tonelist": tonelist == null
            ? []
            : List<dynamic>.from(tonelist!.map((x) => x.toJson())),
      };
}
/*
class Tonelist {
  String? contentType;
  String? activationChannel;
  String? albumName;
  String? artistName;
  String? contentId;
  String? contentName;
  String? contentPreviewImageUrl;
  String? contentStreamingUrl;
  DateTime? expiryDate;
  DateTime? firstActivationDate;
  String? isContentPackage;
  String? languageCode;
  String? price;
  String? status;

  Tonelist({
    this.contentType,
    this.activationChannel,
    this.albumName,
    this.artistName,
    this.contentId,
    this.contentName,
    this.contentPreviewImageUrl,
    this.contentStreamingUrl,
    this.expiryDate,
    this.firstActivationDate,
    this.isContentPackage,
    this.languageCode,
    this.price,
    this.status,
  });

  factory Tonelist.fromJson(Map<String, dynamic> json) => Tonelist(
        contentType: json["ContentType"],
        activationChannel: json["activationChannel"],
        albumName: json["albumName"],
        artistName: json["artistName"],
        contentId: json["contentId"],
        contentName: json["contentName"],
        contentPreviewImageUrl: json["contentPreviewImageURL"],
        contentStreamingUrl: json["contentStreamingURL"],
        expiryDate: json["expiryDate"] == null
            ? null
            : DateTime.parse(json["expiryDate"]),
        firstActivationDate: json["firstActivationDate"] == null
            ? null
            : DateTime.parse(json["firstActivationDate"]),
        isContentPackage: json["isContentPackage"],
        languageCode: json["languageCode"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ContentType": contentType,
        "activationChannel": activationChannel,
        "albumName": albumName,
        "artistName": artistName,
        "contentId": contentId,
        "contentName": contentName,
        "contentPreviewImageURL": contentPreviewImageUrl,
        "contentStreamingURL": contentStreamingUrl,
        "expiryDate": expiryDate?.toIso8601String(),
        "firstActivationDate": firstActivationDate?.toIso8601String(),
        "isContentPackage": isContentPackage,
        "languageCode": languageCode,
        "price": price,
        "status": status,
      };
}
*/