
// To parse this JSON data, do
//
//     final consentModal = consentModalFromJson(jsonString);

import 'dart:convert';

ConsentModal consentModalFromJson(String str) => ConsentModal.fromJson(json.decode(str));

String consentModalToJson(ConsentModal data) => json.encode(data.toJson());

class ConsentModal {
    int respCode;
    String message;
    String consentStatus;
    String sentTimestamp;
    String rcvTimestamp;
    String templateId;
    String userData;

    ConsentModal({
        required this.respCode,
        required this.message,
        required this.consentStatus,
        required this.sentTimestamp,
        required this.rcvTimestamp,
        required this.templateId,
        required this.userData,
    });

    factory ConsentModal.fromJson(Map<String, dynamic> json) => ConsentModal(
        respCode: json["respCode"],
        message: json["message"],
        consentStatus: json["consentStatus"],
        sentTimestamp: json["sentTimestamp"],
        rcvTimestamp: json["rcvTimestamp"],
        templateId: json["templateId"],
        userData: json["userData"],
    );

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
        "consentStatus": consentStatus,
        "sentTimestamp": sentTimestamp,
        "rcvTimestamp": rcvTimestamp,
        "templateId": templateId,
        "userData": userData,
    };
}


// // To parse this JSON data, do
// //
// //     final consentModel = consentModelFromJson(jsonString);

// import 'dart:convert';

// ConsentModel consentModelFromJson(String str) => ConsentModel.fromJson(json.decode(str));

// String consentModelToJson(ConsentModel data) => json.encode(data.toJson());

// class ConsentModel {
//     int respCode;
//     String message;
//     List<TemplateList> templateList;

//     ConsentModel({
//         required this.respCode,
//         required this.message,
//         required this.templateList,
//     });

//     factory ConsentModel.fromJson(Map<String, dynamic> json) => ConsentModel(
//         respCode: json["respCode"],
//         message: json["message"],
//         templateList: List<TemplateList>.from(json["templateList"].map((x) => TemplateList.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "respCode": respCode,
//         "message": message,
//         "templateList": List<dynamic>.from(templateList.map((x) => x.toJson())),
//     };
// }

// class TemplateList {
//     String templateId;
//     String languageCode;
//     String data;

//     TemplateList({
//         required this.templateId,
//         required this.languageCode,
//         required this.data,
//     });

//     factory TemplateList.fromJson(Map<String, dynamic> json) => TemplateList(
//         templateId: json["templateId"],
//         languageCode: json["languageCode"],
//         data: json["data"],
//     );

//     Map<String, dynamic> toJson() => {
//         "templateId": templateId,
//         "languageCode": languageCode,
//         "data": data,
//     };
// }
