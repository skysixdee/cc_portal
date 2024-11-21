import 'dart:convert';

import 'package:cc_portal/Models/consent_modal.dart';
import 'package:cc_portal/api_calls/pack_consent_api.dart';
import 'package:cc_portal/network_manager/network_manager.dart';

import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

Future<ConsentModal> ToneconsentApi(String msisdn,
    {String? offerCode, String? contentId}) async {
  String url = 'http://10.0.10.33:3214/selfcare/consent/fetch-details';

  offerCode ??= extractOfferCode(msisdn);
  await Future.delayed(Duration(seconds: 1));

  Map<String, dynamic> jsonData = {
    "msisdn": StoreManager().customerNumber,
    if (contentId != null) "contentId": contentId,

    // if (offerCode != null) "offerCode": offerCode,
    // if (contentId != null) "contentId": contentId,
  };

  Map<String, dynamic> jsonMap =
      await NetworkManager().postResquest(url, jsonData);
  return ConsentModal.fromJson(jsonMap);
}



// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<Map<String, dynamic>> consentApi2(String phoneNumber,  String? contentId) async {
//   String url = 'http://10.0.10.33:3214/selfcare/consent/fetch-details';

//   // Request data
//   Map<String, dynamic> jsonData = {
//     "msisdn": phoneNumber,
//    // "offerCode": offerCode, 
//     if (contentId != null) "contentId": contentId,
//   };

//   // Make the API call
//   final response = await http.post(Uri.parse(url), body: jsonData);
//   if (response.statusCode == 200) {
//     return json.decode(response.body);
//   } else {
//     throw Exception('Failed to fetch consent details');
//   }
// }




// String? extractcontentId() {
//   String toneResponse = '''
//   {
//   "respCode" : 0, "message" : "successful" , "tonelist" :[{"ContentType":"1","activationChannel":"1","chargedDate":"2024-08-27 17:12:51","contentId":"66797","contentPreviewImageURL":"https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=q8UPITRgHas=","contentStreamingURL":"https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=q8UPITRgHas=","expiryDate":"2024-09-03 17:12:50","firstActivationDate":"2024-08-27 17:13:01","isContentPackage":"0","languageCode":"en","price":"20","status":"A"},{"ContentType":"1","activationChannel":"1","albumName_L2":"American Life","artistName_L2":"Madonna","chargedDate":"2024-08-27 17:12:51","contentId":"66798","contentName_L2":"Intervention","contentPreviewImageURL":"https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=ITTbnsELK0o=","contentStreamingURL":"https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=ITTbnsELK0o=","expiryDate":"2024-09-03 17:12:50","firstActivationDate":"2024-08-27 17:13:01","isContentPackage":"0","languageCode":"en","price":"20","status":"A"},{"ContentType":"1","activationChannel":"1","albumName":"&#78;&#85;&#83;&#82;&#65;&#84;&#32;&#70;&#65;&#84;&#69;&#72;&#32;&#65;&#76;&#73;&#32;&#75;&#72;&#65;&#78;","artistName":"&#78;&#85;&#83;&#82;&#65;&#84;&#32;&#70;&#65;&#84;&#69;&#72;&#32;&#65;&#76;&#73;&#32;&#75;&#72;&#65;&#78;","chargedDate":"2024-08-27 17:12:51","contentId":"7890121","contentName":"&#65;&#65;&#74;&#65;&#32;&#83;&#65;&#74;&#78;&#65;&#32;&#86;&#69;&#32;&#67;&#72;&#79;&#82;&#65;","contentPreviewImageURL":"https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=vwcPDjvceo4=","contentStreamingURL":"https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=vwcPDjvceo4=","expiryDate":"2024-09-03 17:12:50","firstActivationDate":"2024-08-27 17:13:01","isContentPackage":"0","languageCode":"en","price":"20","status":"A"},{"ContentType":"1","activationChannel":"1","albumName_L2":"American Life","artistName_L2":"Madonna","chargedDate":"2024-08-27 17:12:51","contentId":"7890125","contentName_L2":"Intervention","contentPreviewImageURL":"https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=7yUF0sY3iXE=","contentStreamingURL":"https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=7yUF0sY3iXE=","expiryDate":"2024-09-03 17:12:50","firstActivationDate":"2024-08-27 17:13:01","isContentPackage":"0","languageCode":"en","price":"20","status":"A"},{"ContentType":"1","activationChannel":"2","albumName":"&#78;&#85;&#83;&#82;&#65;&#84;&#32;&#70;&#65;&#84;&#69;&#72;&#32;&#65;&#76;&#73;&#32;&#75;&#72;&#65;&#78;","artistName":"&#78;&#85;&#83;&#82;&#65;&#84;&#32;&#70;&#65;&#84;&#69;&#72;&#32;&#65;&#76;&#73;&#32;&#75;&#72;&#65;&#78;","chargedDate":"2024-09-03 15:25:42","contentId":"99991","contentName":"&#65;&#65;&#74;&#65;&#32;&#83;&#65;&#74;&#78;&#65;&#32;&#86;&#69;&#32;&#67;&#72;&#79;&#82;&#65;","contentPreviewImageURL":"https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=lrOVEDYo2PU=","contentStreamingURL":"https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=lrOVEDYo2PU=","expiryDate":"2024-10-01 15:25:42","firstActivationDate":"2024-09-03 15:25:53","isContentPackage":"0","languageCode":"en","price":"43","status":"A"} ] }
//   ''';

//   Map<String, dynamic> responseMap = jsonDecode(toneResponse);
//   List<dynamic> tonelist = responseMap['tonelist'];

// }

// Future<ConsentModel> consent1(String msisdn,
//     {String? offerCode, String? contentId}) async {
//   String url = 'http://10.0.10.33:3214/selfcare/consent/fetch-details';

//   contentId ??= contentId;

//   Map<String, dynamic> jsonData = {
//     "msisdn": "92000022",
//     if (offerCode != null) "offerCode": offerCode,
//     if (contentId != null) "contentId": contentId,
//   };

//   print("Request Body: $jsonData");
// await Future.delayed(Duration(seconds: 10));
//   Map<String, dynamic> jsonMap =
//       await NetworkManager().postResquest(url, jsonData);

//   ConsentModel modal = ConsentModel.fromJson(jsonMap);

//   print("modal = ${modal.message}");

//   return modal;
// }
// Adjust this import according to your project structure