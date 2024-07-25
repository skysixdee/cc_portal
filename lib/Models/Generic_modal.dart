// To parse this JSON data, do
//
//     final genericModal = genericModalFromJson(jsonString);

import 'dart:convert';

GenericModal genericModalFromJson(String str) =>
    GenericModal.fromJson(json.decode(str));

String genericModalToJson(GenericModal data) => json.encode(data.toJson());

class GenericModal {
  int? respCode;
  String? message;

  GenericModal({
    this.respCode,
    this.message,
  });

  factory GenericModal.fromJson(Map<String, dynamic> json) => GenericModal(
        respCode: json["respCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
      };
}
