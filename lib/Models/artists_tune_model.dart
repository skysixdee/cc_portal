// To parse this JSON data, do
//
//     final artistsToneModel = artistsToneModelFromJson(jsonString);

import 'dart:convert';

import 'package:sm_admin_portal/Models/tone_info.dart';

ArtistsToneModel artistsToneModelFromJson(String str) =>
    ArtistsToneModel.fromJson(json.decode(str));

String artistsToneModelToJson(ArtistsToneModel data) =>
    json.encode(data.toJson());

class ArtistsToneModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  ArtistsToneModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory ArtistsToneModel.fromJson(Map<String, dynamic> json) =>
      ArtistsToneModel(
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
  int? resultCount;
  List<ToneInfo>? toneList;

  ResponseMap({
    this.resultCount,
    this.toneList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        resultCount: json["resultCount"],
        toneList: json["toneList"] == null
            ? []
            : List<ToneInfo>.from(
                json["toneList"]!.map((x) => ToneInfo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "toneList": toneList == null
            ? []
            : List<dynamic>.from(toneList!.map((x) => x.toJson())),
      };
}
