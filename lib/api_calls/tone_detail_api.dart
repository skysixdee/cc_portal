import 'dart:convert';

import 'package:sm_admin_portal/Models/tone_detail_modal.dart';

Future<ToneDetailModal> getToneDetailApi() async {
  String url =
      'http://10.0.10.33:8085/selfcare/subscriber-management/list-tones';
  Map<String, dynamic> jsonData = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "offerCode": "",
    "languageCode": "",
    "channelId": "",
  };
  // Map<String, dynamic> jsonMap =
  //     await NetworkManager().postResquest(url, jsonData);
  Map<String, dynamic> respMap = json.decode(respoString);
  ToneDetailModal model = ToneDetailModal.fromJson(respMap);
  return model;
}

String respoString = """"{
    "respCode": 0,
    "message": "successful",
    "tonelist": [
        {
            "contentId": "2345567",
            "contentName": "Allahumma Eateq Reqabana",
            "albumName": "afafaga",
            "artistName": "Maher Al Muaiqly",
            "isContentPackage": "0",
            "contentType": "1",
            "contentStreamingURL": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "contentPreviewImageURL": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "status": "A",
            "firstActivationDate": "2023-12-13 16:27:57",
            "price": "10.5"
        },
        {
            "contentId": "2345567",
            "contentName": "Allahumma Eateq Reqabana",
            "albumName": "afafaga",
            "artistName": "Maher Al Muaiqly",
            "isContentPackage": "0",
            "contentType": "1",
            "contentStreamingURL": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "contentPreviewImageURL": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "status": "A",
            "firstActivationDate": "2023-12-13 16:27:57",
            "price": "10.5"
        },
        {
            "contentId": "2345567",
            "contentName": "Allahumma Eateq Reqabana",
            "albumName": "afafaga",
            "artistName": "Maher Al Muaiqly",
            "isContentPackage": "0",
            "contentType": "1",
            "contentStreamingURL": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "contentPreviewImageURL": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "status": "A",
            "firstActivationDate": "2023-12-13 16:27:57",
            "price": "10.5"
        }
    ]
    
}""";
