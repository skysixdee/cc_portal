// To parse this JSON data, do
//
//     final listToneSettingModel = listToneSettingModelFromJson(jsonString);

import 'dart:convert';

ListToneSettingModel listToneSettingModelFromJson(String str) => ListToneSettingModel.fromJson(json.decode(str));

String listToneSettingModelToJson(ListToneSettingModel data) => json.encode(data.toJson());

class ListToneSettingModel {
    int? respCode;
    String? message;
    List<Settingslist>? settingslist;

    ListToneSettingModel({
        this.respCode,
        this.message,
        this.settingslist,
    });

    factory ListToneSettingModel.fromJson(Map<String, dynamic> json) => ListToneSettingModel(
        respCode: json["respCode"],
        message: json["message"],
        settingslist: json["settingslist"] == null ? [] : List<Settingslist>.from(json["settingslist"]!.map((x) => Settingslist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "settingslist": settingslist == null ? [] : List<dynamic>.from(settingslist!.map((x) => x.toJson())),
    };
}

class Settingslist {
    String? serviceId;
    String? serviceName;
    String? contentId;
    String? selectionType;
    String? isShuffleOn;
    String? isServiceSuspended;

    Settingslist({
        this.serviceId,
        this.serviceName,
        this.contentId,
        this.selectionType,
        this.isShuffleOn,
        this.isServiceSuspended,
    });

    factory Settingslist.fromJson(Map<String, dynamic> json) => Settingslist(
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
        contentId: json["contentId"],
        selectionType: json["selectionType"],
        isShuffleOn: json["isShuffleOn"],
        isServiceSuspended: json["isServiceSuspended"],
    );

    Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "serviceName": serviceName,
        "contentId": contentId,
        "selectionType": selectionType,
        "isShuffleOn": isShuffleOn,
        "isServiceSuspended": isServiceSuspended,
    };
}
