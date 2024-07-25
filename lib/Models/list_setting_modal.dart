// // To parse this JSON data, do
// //
// //     final listSettingModel = listSettingModelFromJson(jsonString);

// import 'dart:convert';

// ListSettingModel listSettingModelFromJson(String str) => ListSettingModel.fromJson(json.decode(str));

// String listSettingModelToJson(ListSettingModel data) => json.encode(data.toJson());

// class ListSettingModel {
//     int? respCode;
//     String? message;
//     List<Settingslist>? settingslist;

//     ListSettingModel({
//         this.respCode,
//         this.message,
//         this.settingslist,
//     });

//     factory ListSettingModel.fromJson(Map<String, dynamic> json) => ListSettingModel(
//         respCode: json["respCode"],
//         message: json["message"],
//         settingslist: json["settingslist"] == null ? [] : List<Settingslist>.from(json["settingslist"]!.map((x) => Settingslist.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "respCode": respCode,
//         "message": message,
//         "settingslist": settingslist == null ? [] : List<dynamic>.from(settingslist!.map((x) => x.toJson())),
//     };
// }

// class Settingslist {
//     String? serviceId;
//     String? serviceName;
//     String? contentId;
//     String? selectionType;
//     String? isShuffleOn;
//     String? isServiceSuspended;

//     Settingslist({
//         this.serviceId,
//         this.serviceName,
//         this.contentId,
//         this.selectionType,
//         this.isShuffleOn,
//         this.isServiceSuspended,
//     });

//     factory Settingslist.fromJson(Map<String, dynamic> json) => Settingslist(
//         serviceId: json["serviceId"],
//         serviceName: json["serviceName"],
//         contentId: json["contentId"],
//         selectionType: json["selectionType"],
//         isShuffleOn: json["isShuffleOn"],
//         isServiceSuspended: json["isServiceSuspended"],
//     );

//     Map<String, dynamic> toJson() => {
//         "serviceId": serviceId,
//         "serviceName": serviceName,
//         "contentId": contentId,
//         "selectionType": selectionType,
//         "isShuffleOn": isShuffleOn,
//         "isServiceSuspended": isServiceSuspended,
//     };
// }


// To parse this JSON data, do
//
//     final listSettingModel = listSettingModelFromJson(jsonString);

import 'dart:convert';

ListSettingModel listSettingModelFromJson(String str) => ListSettingModel.fromJson(json.decode(str));

String listSettingModelToJson(ListSettingModel data) => json.encode(data.toJson());

class ListSettingModel {
    int? respCode;
    String? message;
    List<SettingsList>? settingsList;

    ListSettingModel({
        this.respCode,
        this.message,
        this.settingsList,
    });

    factory ListSettingModel.fromJson(Map<String, dynamic> json) => ListSettingModel(
        respCode: json["respCode"],
        message: json["message"],
        settingsList: json["settingsList"] == null ? [] : List<SettingsList>.from(json["settingsList"]!.map((x) => SettingsList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "settingsList": settingsList == null ? [] : List<dynamic>.from(settingsList!.map((x) => x.toJson())),
    };
}

class SettingsList {
    String? contentType;
    String? activationChannel;
    String? albumName;
    String? artistName;
    String? contentId;
    String? contentName;
    String? contentPreviewImageUrl;
    String? contentStreamingUrl;
    String? expiryDate;
    String? firstActivationDate;
    String? isContentPackage;
    String? isServiceSuspended;
    String? isShuffleOn;
    String? price;
    String? selectionType;
    String? serviceId;
    String? serviceName;
    String? status;

    SettingsList({
        this.contentType,
        this.activationChannel,
        this.albumName,
        this.artistName,
        this.contentId,
        this.contentName,
        this.contentPreviewImageUrl,
        this.contentStreamingUrl,
        this.expiryDate,
        this.firstActivationDate,
        this.isContentPackage,
        this.isServiceSuspended,
        this.isShuffleOn,
        this.price,
        this.selectionType,
        this.serviceId,
        this.serviceName,
        this.status,
    });

    factory SettingsList.fromJson(Map<String, dynamic> json) => SettingsList(
        contentType: json["ContentType"],
        activationChannel: json["activationChannel"],
        albumName: json["albumName"],
        artistName: json["artistName"],
        contentId: json["contentId"],
        contentName: json["contentName"],
        contentPreviewImageUrl: json["contentPreviewImageURL"],
        contentStreamingUrl: json["contentStreamingURL"],
        expiryDate: json["expiryDate"],
        firstActivationDate: json["firstActivationDate"],
        isContentPackage: json["isContentPackage"],
        isServiceSuspended: json["isServiceSuspended"],
        isShuffleOn: json["isShuffleOn"],
        price: json["price"],
        selectionType: json["selectionType"],
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "ContentType": contentType,
        "activationChannel": activationChannel,
        "albumName": albumName,
        "artistName": artistName,
        "contentId": contentId,
        "contentName": contentName,
        "contentPreviewImageURL": contentPreviewImageUrl,
        "contentStreamingURL": contentStreamingUrl,
        "expiryDate": expiryDate,
        "firstActivationDate": firstActivationDate,
        "isContentPackage": isContentPackage,
        "isServiceSuspended": isServiceSuspended,
        "isShuffleOn": isShuffleOn,
        "price": price,
        "selectionType": selectionType,
        "serviceId": serviceId,
        "serviceName": serviceName,
        "status": status,
    };
}
