// To parse this JSON data, do
//
//     final templetMessageModel = templetMessageModelFromJson(jsonString);

import 'dart:convert';

TempletMessageModel templetMessageModelFromJson(String str) =>
    TempletMessageModel.fromJson(json.decode(str));

String templetMessageModelToJson(TempletMessageModel data) =>
    json.encode(data.toJson());

class TempletMessageModel {
  int? respCode;
  String? message;
  List<TemplateList>? templateList;

  TempletMessageModel({
    this.respCode,
    this.message,
    this.templateList,
  });

  factory TempletMessageModel.fromJson(Map<String, dynamic> json) =>
      TempletMessageModel(
        respCode: json["respCode"],
        message: json["message"],
        templateList: json["templateList"] == null
            ? []
            : List<TemplateList>.from(
                json["templateList"]!.map((x) => TemplateList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "templateList": templateList == null
            ? []
            : List<dynamic>.from(templateList!.map((x) => x.toJson())),
      };
}

class TemplateList {
  String? templateId;
  String? languageCode;
  String? data;

  TemplateList({
    this.templateId,
    this.languageCode,
    this.data,
  });

  factory TemplateList.fromJson(Map<String, dynamic> json) => TemplateList(
        templateId: json["templateId"],
        languageCode: json["languageCode"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "templateId": templateId,
        "languageCode": languageCode,
        "data": data,
      };
}
