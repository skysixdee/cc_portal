/*import 'dart:convert';

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
  await Future.delayed(Duration(seconds: 3));
  Map<String, dynamic> respMap = json.decode(respoString1);
  ToneDetailModal modal = ToneDetailModal.fromJson(respMap);
   
  return ToneDetailModal();
}

String respoString1 = """"{
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
    
}""";*/


import 'dart:convert';

import 'package:http/http.dart' as http; // Import http package for making HTTP requests
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<ToneDetailModal> getToneDetailApi() async {
  //String url = 'http://10.0.10.33:8085/selfcare/subscriber-management/list-tones';
  Map<String, dynamic> jsonData = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "offerCode": "",
    "languageCode": "",
    "channelId": "",
  };
  
   try {
  //   final response = await http.post(
  //     Uri.parse(url),
  //     body: jsonEncode(jsonData),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );

//Map<String, dynamic> respMap =await NetworkManager().postResquest(toneDetailUrl, jsonData);

Map<String, dynamic> respMap = json.decode(toneDetailResp);
return ToneDetailModal.fromJson(respMap);
    
  } catch (e) {
   // throw Exception('Failed to connect to the server: $e');
    return ToneDetailModal(message: 'Failed to connect to the server');
  }
}


String toneDetailResp = """{
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
            "contentId": "2005567",
            "contentName": " Eateq Reqabana Allahumma",
            "albumName": "afafaga",
            "artistName": "Maher Al Muaiqly",
            "isContentPackage": "0",
            "contentType": "1",
            "contentStreamingURL": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "contentPreviewImageURL": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "status": "D",
            "firstActivationDate": "2023-12-13 16:27:57",
            "price": "10.5"
        },
        {
            "contentId": "1005567",
            "contentName": "Eateq Allahumma  Reqabana",
            "albumName": "afafaga",
            "artistName": "Maher Al Muaiqly",
            "isContentPackage": "0",
            "contentType": "1",
            "contentStreamingURL": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "contentPreviewImageURL": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=0Shprh9x2cffRp5KT5lW1Q==",
            "status": "A",
            "firstActivationDate": "2023-12-13 16:27:57",
            "price": "10.5"
        },{
            "contentId": "4045567",
            "contentName": "Reqabana Allahumma Eateq ",
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
}

""";
//////////////////////////////////
