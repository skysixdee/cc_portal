// To parse this JSON data, do
//
//     final toneSearchModel = toneSearchModelFromJson(jsonString);

// import 'dart:convert';

// ToneSearchModel toneSearchModelFromJson(String str) =>
//     ToneSearchModel.fromJson(json.decode(str));

// String toneSearchModelToJson(ToneSearchModel data) =>
//     json.encode(data.toJson());

// class ToneSearchModel {
//   int? count;
//   List<ToneInfo>? data;
//   int? total;

//   ToneSearchModel({
//     this.count,
//     this.data,
//     this.total,
//   });

//   factory ToneSearchModel.fromJson(Map<String, dynamic> json) =>
//       ToneSearchModel(
//         count: json["count"],
//         data: json["data"] == null
//             ? []
//             : List<ToneInfo>.from(
//                 json["data"]!.map((x) => ToneInfo.fromJson(x))),
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "total": total,
//       };
// }

// class ToneInfo {
//   List<Tone>? tones;
//   List<Offer>? offers;

//   ToneInfo({
//     this.tones,
//     this.offers,
//   });

//   factory ToneInfo.fromJson(Map<String, dynamic> json) => ToneInfo(
//         tones: json["tones"] == null
//             ? []
//             : List<Tone>.from(json["tones"]!.map((x) => Tone.fromJson(x))),
//         offers: json["offers"] == null
//             ? []
//             : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "tones": tones == null
//             ? []
//             : List<dynamic>.from(tones!.map((x) => x.toJson())),
//         "offers": offers == null
//             ? []
//             : List<dynamic>.from(offers!.map((x) => x.toJson())),
//       };
// }

// class Offer {
//   String? offerCode;
//   String? offerName;

//   Offer({
//     this.offerCode,
//     this.offerName,
//   });

//   factory Offer.fromJson(Map<String, dynamic> json) => Offer(
//         offerCode: json["offerCode"],
//         offerName: json["offerName"],
//       );

//   Map<String, dynamic> toJson() => {
//         "offerCode": offerCode,
//         "offerName": offerName,
//       };
// }

// class Tone {
//   String? toneNameEnglish;
//   String? location;
//   String? albumEnglish;
//   String? artistEnglish;
//   String? contentProviderName;
//   String? toneId;

//   Tone({
//     this.toneNameEnglish,
//     this.location,
//     this.albumEnglish,
//     this.artistEnglish,
//     this.contentProviderName,
//     this.toneId,
//   });

//   factory Tone.fromJson(Map<String, dynamic> json) => Tone(
//         toneNameEnglish: json["toneNameEnglish"],
//         location: json["location"],
//         albumEnglish: json["albumEnglish"],
//         artistEnglish: json["artistEnglish"],
//         contentProviderName: json["contentProviderName"],
//         toneId: json["toneId"],
//       );

//   get artist => null;

//   Map<String, dynamic> toJson() => {
//         "toneNameEnglish": toneNameEnglish,
//         "location": location,
//         "albumEnglish": albumEnglish,
//         "artistEnglish": artistEnglish,
//         "contentProviderName": contentProviderName,
//         "toneId": toneId,
//       };
// }
// To parse this JSON data, do
//
//     final toneActivationModall = toneActivationModallFromJson(jsonString);

import 'dart:convert';

ToneActivationModall toneActivationModallFromJson(String str) =>
    ToneActivationModall.fromJson(json.decode(str));

String toneActivationModallToJson(ToneActivationModall data) =>
    json.encode(data.toJson());

class ToneActivationModall {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  ToneActivationModall({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory ToneActivationModall.fromJson(Map<String, dynamic> json) =>
      ToneActivationModall(
        responseMap: json["responseMap"] == null
            ? null
            : ResponseMap.fromJson(json["responseMap"]),
        message: json["message"],
        respTime: json["respTime"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "responseMap": responseMap?.toJson(),
        "message": message,
        "respTime": respTime,
        "statusCode": statusCode,
      };
}

class ResponseMap {
  List<ToneList>? toneList;

  ResponseMap({
    this.toneList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        toneList: json["toneList"] == null
            ? []
            : List<ToneList>.from(
                json["toneList"]!.map((x) => ToneList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "toneList": toneList == null
            ? []
            : List<dynamic>.from(toneList!.map((x) => x.toJson())),
      };
}

class ToneList {
  String? toneId;
  String? toneName;
  String? artistName;
  String? albumName;
  int? price;
  int? categoryId;
  String? expiryDate;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;

  ToneList({
    this.toneId,
    this.toneName,
    this.artistName,
    this.albumName,
    this.price,
    this.categoryId,
    this.expiryDate,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
  });

  factory ToneList.fromJson(Map<String, dynamic> json) => ToneList(
        toneId: json["toneId"],
        toneName: json["toneName"],
        artistName: json["artistName"],
        albumName: json["albumName"],
        price: json["price"],
        categoryId: json["categoryId"],
        expiryDate: json["expiryDate"],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "toneId": toneId,
        "toneName": toneName,
        "artistName": artistName,
        "albumName": albumName,
        "price": price,
        "categoryId": categoryId,
        "expiryDate": expiryDate,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}
