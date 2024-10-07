// To parse this JSON data, do
//
//     final dummyModal = dummyModalFromJson(jsonString);

// To parse this JSON data, do
//
//     final toneDetailModal = toneDetailModalFromJson(jsonString);

// To parse this JSON data, do
//
//     final toneDetailModal = toneDetailModalFromJson(jsonString);

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
  String? contentType;
  String? activationChannel;
  String? albumName;
  String? albumNameL2;
  String? artistName;
  String? artistNameL2;
  String? chargedDate;
  String? contentId;
  String? contentName;
  String? contentNameL2;
  String? contentPreviewImageUrl;
  String? contentStreamingUrl;
  String? expiryDate;
  String? firstActivationDate;
  String? isContentPackage;
  String? languageCode;
  String? price;
  String? status;
  RxBool? isSuspend = true.obs;

  Tonelist({
    this.contentType,
    this.activationChannel,
    this.albumName,
    this.albumNameL2,
    this.artistName,
    this.artistNameL2,
    this.chargedDate,
    this.contentId,
    this.contentName,
    this.contentNameL2,
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
        albumNameL2: json["albumName_L2"],
        artistName: json["artistName"],
        artistNameL2: json["artistName_L2"],
        chargedDate: json["chargedDate"] == null ? null : json["chargedDate"],
        contentId: json["contentId"],
        contentName: json["contentName"],
        contentNameL2: json["contentName_L2"],
        contentPreviewImageUrl: json["contentPreviewImageURL"],
        contentStreamingUrl: json["contentStreamingURL"],
        expiryDate: json["expiryDate"] == null ? null : json["expiryDate"],
        firstActivationDate: json["firstActivationDate"] == null
            ? null
            : json["firstActivationDate"],
        isContentPackage: json["isContentPackage"],
        languageCode: json["languageCode"],
        price: json["price"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ContentType": contentType,
        "activationChannel": activationChannel,
        "albumName": albumName,
        "albumName_L2": albumNameL2,
        "artistName": artistName,
        "artistName_L2": artistNameL2,
        "chargedDate": chargedDate,
        "contentId": contentId,
        "contentName": contentName,
        "contentName_L2": contentNameL2,
        "contentPreviewImageURL": contentPreviewImageUrl,
        "contentStreamingURL": contentStreamingUrl,
        "expiryDate": expiryDate,
        "firstActivationDate": firstActivationDate,
        "isContentPackage": isContentPackage,
        "languageCode": languageCode,
        "price": price,
        "status": status,
      };
}


/*

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
*/