// To parse this JSON data, do
//
//     final artistSearchModel = artistSearchModelFromJson(jsonString);

import 'dart:convert';

ArtistSearchModel artistSearchModelFromJson(String str) =>
    ArtistSearchModel.fromJson(json.decode(str));

String artistSearchModelToJson(ArtistSearchModel data) =>
    json.encode(data.toJson());

class ArtistSearchModel {
  ResponseMap? responseMap;
  String? message;
  String? respTime;
  String? statusCode;

  ArtistSearchModel({
    this.responseMap,
    this.message,
    this.respTime,
    this.statusCode,
  });

  factory ArtistSearchModel.fromJson(Map<String, dynamic> json) =>
      ArtistSearchModel(
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
  List<ArtistList>? artistList;

  ResponseMap({
    this.resultCount,
    this.artistList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        resultCount: json["resultCount"],
        artistList: json["artistList"] == null
            ? []
            : List<ArtistList>.from(
                json["artistList"]!.map((x) => ArtistList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "artistList": artistList == null
            ? []
            : List<dynamic>.from(artistList!.map((x) => x.toJson())),
      };
}

class ArtistList {
  String? val;
  int? count;

  ArtistList({
    this.val,
    this.count,
  });

  factory ArtistList.fromJson(Map<String, dynamic> json) => ArtistList(
        val: json["val"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "val": val,
        "count": count,
      };
}
