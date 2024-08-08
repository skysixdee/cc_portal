// To parse this JSON data, do
//
//     final dummyModal = dummyModalFromJson(jsonString);

// To parse this JSON data, do
//
//     final toneDetailModal = toneDetailModalFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

ToneDetailModal toneDetailModalFromJson(String str) =>
    ToneDetailModal.fromJson(json.decode(str));

String toneDetailModalToJson(ToneDetailModal data) =>
    json.encode(data.toJson());

class ToneDetailModal {
  int? respCode;
  String? message;
  List<Tonelist>? tonelist;

  ToneDetailModal({
    this.respCode,
    this.message,
    this.tonelist,
  });

  factory ToneDetailModal.fromJson(Map<String, dynamic> json) =>
      ToneDetailModal(
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

class Tonelist {
  String? contentId;
  String? contentName;
  String? albumName;
  String? artistName;
  String? isContentPackage;
  String? contentType;
  String? contentStreamingUrl;
  String? contentPreviewImageUrl;
  String? status;
  String? firstActivationDate;
  String? expiryDate;
  String? price;
  RxBool? isSuspend = true.obs;
  Tonelist({
    this.contentId,
    this.contentName,
    this.albumName,
    this.artistName,
    this.isContentPackage,
    this.contentType,
    this.contentStreamingUrl,
    this.contentPreviewImageUrl,
    this.status,
    this.firstActivationDate,
    this.expiryDate,
    this.price,
  });

  factory Tonelist.fromJson(Map<String, dynamic> json) => Tonelist(
        contentId: json["contentId"],
        contentName: json["contentName"],
        albumName: json["albumName"],
        artistName: json["artistName"],
        isContentPackage: json["isContentPackage"],
        contentType: json["contentType"],
        contentStreamingUrl: json["contentStreamingURL"],
        contentPreviewImageUrl: json["contentPreviewImageURL"],
        status: json["status"],
        firstActivationDate: json["firstActivationDate"],
        expiryDate: json["expiryDate"],
        price: json["price"],
      );

  get toneNameEnglish => null;

  get artistEnglish => null;

  get toneId => null;

  Map<String, dynamic> toJson() => {
        "contentId": contentId,
        "contentName": contentName,
        "albumName": albumName,
        "artistName": artistName,
        "isContentPackage": isContentPackage,
        "contentType": contentType,
        "contentStreamingURL": contentStreamingUrl,
        "contentPreviewImageURL": contentPreviewImageUrl,
        "status": status,
        "firstActivationDate": firstActivationDate,
        "price": price,
      };
}
