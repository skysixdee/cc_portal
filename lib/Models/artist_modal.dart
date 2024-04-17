// To parse this JSON data, do
//
//     final toneActivationArtistModal = toneActivationArtistModalFromJson(jsonString);

import 'dart:convert';

ToneActivationArtistModal toneActivationArtistModalFromJson(String str) => ToneActivationArtistModal.fromJson(json.decode(str));

String toneActivationArtistModalToJson(ToneActivationArtistModal data) => json.encode(data.toJson());

class ToneActivationArtistModal {
    int? respCode;
    String? message;

    ToneActivationArtistModal({
        this.respCode,
        this.message,
    });

    factory ToneActivationArtistModal.fromJson(Map<String, dynamic> json) => ToneActivationArtistModal(
        respCode: json["respCode"],
        message: json["message"],
    );
      
  get data => null;

    Map<String, dynamic> toJson() => {
        "respCode": respCode,
        "message": message,
    };
}



