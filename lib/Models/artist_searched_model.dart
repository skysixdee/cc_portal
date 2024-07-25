// To parse this JSON data, do
//
//     final artistSearchModel = artistSearchModelFromJson(jsonString);

import 'dart:convert';

ArtistSearchModel artistSearchModelFromJson(String str) =>
    ArtistSearchModel.fromJson(json.decode(str));

String artistSearchModelToJson(ArtistSearchModel data) =>
    json.encode(data.toJson());

class ArtistSearchModel {
  String? message;
  String? respTime;
  String? statusCode;
  ResponseMap? responseMap;

  ArtistSearchModel({
    this.message,
    this.respTime,
    this.statusCode,
    this.responseMap,
  });

  factory ArtistSearchModel.fromJson(Map<String, dynamic> json) =>
      ArtistSearchModel(
        message: json["message"],
        respTime: json["respTime"],
        statusCode: json["statusCode"],
        responseMap: json["responseMap"] == null
            ? null
            : ResponseMap.fromJson(json["responseMap"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "respTime": respTime,
        "statusCode": statusCode,
        "responseMap": responseMap?.toJson(),
      };
}

class ResponseMap {
  List<ArtistList>? artistList;

  ResponseMap({
    this.artistList,
  });

  factory ResponseMap.fromJson(Map<String, dynamic> json) => ResponseMap(
        artistList: json["artistList"] == null
            ? []
            : List<ArtistList>.from(
                json["artistList"]!.map((x) => ArtistList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
