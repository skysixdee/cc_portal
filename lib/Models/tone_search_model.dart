// To parse this JSON data, do
//
//     final toneSearchModel = toneSearchModelFromJson(jsonString);

import 'dart:convert';

ToneSearchModel toneSearchModelFromJson(String str) =>
    ToneSearchModel.fromJson(json.decode(str));

String toneSearchModelToJson(ToneSearchModel data) =>
    json.encode(data.toJson());

class ToneSearchModel {
  int? count;
  List<ToneInfo>? data;
  int? total;

  ToneSearchModel({
    this.count,
    this.data,
    this.total,
  });

  factory ToneSearchModel.fromJson(Map<String, dynamic> json) =>
      ToneSearchModel(
        count: json["count"],
        data: json["data"] == null
            ? []
            : List<ToneInfo>.from(
                json["data"]!.map((x) => ToneInfo.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class ToneInfo {
  List<Tone>? tones;
  List<Offer>? offers;

  ToneInfo({
    this.tones,
    this.offers,
  });

  factory ToneInfo.fromJson(Map<String, dynamic> json) => ToneInfo(
        tones: json["tones"] == null
            ? []
            : List<Tone>.from(json["tones"]!.map((x) => Tone.fromJson(x))),
        offers: json["offers"] == null
            ? []
            : List<Offer>.from(json["offers"]!.map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tones": tones == null
            ? []
            : List<dynamic>.from(tones!.map((x) => x.toJson())),
        "offers": offers == null
            ? []
            : List<dynamic>.from(offers!.map((x) => x.toJson())),
      };
}

class Offer {
  String? offerCode;
  String? offerName;

  Offer({
    this.offerCode,
    this.offerName,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        offerCode: json["offerCode"],
        offerName: json["offerName"],
      );

  Map<String, dynamic> toJson() => {
        "offerCode": offerCode,
        "offerName": offerName,
      };
}

class Tone {
  String? toneNameEnglish;
  String? location;
  String? albumEnglish;
  String? artistEnglish;
  String? contentProviderName;
  String? toneId;

  Tone({
    this.toneNameEnglish,
    this.location,
    this.albumEnglish,
    this.artistEnglish,
    this.contentProviderName,
    this.toneId,
  });

  factory Tone.fromJson(Map<String, dynamic> json) => Tone(
        toneNameEnglish: json["toneNameEnglish"],
        location: json["location"],
        albumEnglish: json["albumEnglish"],
        artistEnglish: json["artistEnglish"],
        contentProviderName: json["contentProviderName"],
        toneId: json["toneId"],
      );

  Map<String, dynamic> toJson() => {
        "toneNameEnglish": toneNameEnglish,
        "location": location,
        "albumEnglish": albumEnglish,
        "artistEnglish": artistEnglish,
        "contentProviderName": contentProviderName,
        "toneId": toneId,
      };
}
