// To parse this JSON data, do
//
//     final searchToneModel = searchToneModelFromJson(jsonString);

import 'dart:convert';

import 'package:cc_portal/Models/tone_info.dart';

SearchToneModel searchToneModelFromJson(String str) =>
    SearchToneModel.fromJson(json.decode(str));

String searchToneModelToJson(SearchToneModel data) =>
    json.encode(data.toJson());

class SearchToneModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  SearchToneModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory SearchToneModel.fromJson(Map<String, dynamic> json) =>
      SearchToneModel(
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
