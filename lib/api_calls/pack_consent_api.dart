import 'package:cc_portal/Models/consent_modal.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'dart:convert';  

import 'dart:convert';
 // Adjust this import according to your project structure
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

String? extractOfferCode(String msisdn) {
  String subscriptionResponse = '''
  {
    "msisdn" : "9239198010",
    "respCode" : 0,
    "message": "successful",
    "offers": [
      {
        "offerName": "CRBT_STANDARD_WEEKLY_REC",
        "offerStatus": "A",
        "expiryDate": "2024-08-15 15:05:18",
        "chargedAmount" : "34.00",
        "chargedDate" : "2024-07-18 15:05:18",
        "chargedValidity" : "28",
        "activationChannel" : "2",
        "userPreferredLanguage" : "en",
        "groupId" : "1",
        "firstActivationDate" : "2024-07-11 15:05:35"
      },
      {
        "offerName": "45",
        "offerStatus": "A",
        "expiryDate": "2024-08-15 15:05:18",
        "chargedAmount" : "34.00",
        "chargedDate" : "2024-07-18 15:05:18",
        "chargedValidity" : "28",
        "activationChannel" : "2",
        "userPreferredLanguage" : "en",
        "groupId" : "7",
        "firstActivationDate" : "2024-08-18 14:15:26"
      }
    ]
  }
  ''';

  Map<String, dynamic> responseMap = jsonDecode(subscriptionResponse);
  List<dynamic> offers = responseMap['offers'];
  for (var offer in offers) {
    if (offer['offerStatus'] == "A") {
      return offer['offerName'];
    }
  }
  return null;
}

Future<ConsentModal> PackconsentApi(String msisdn, {String? offerCode, String? contentId}) async {
  String url = 'http://10.0.10.33:3214/selfcare/consent/fetch-details';
  
  offerCode ??= extractOfferCode(msisdn);
  await Future.delayed(Duration(seconds: 1));
  
  Map<String, dynamic> jsonData = {
    "msisdn": StoreManager().customerNumber,
    if (offerCode != null) "offerCode": offerCode,
    if (contentId != null) "contentId": contentId,
  };

  Map<String, dynamic> jsonMap = await NetworkManager().postResquest(url, jsonData);

  return ConsentModal.fromJson(jsonMap);
}

// String? extractOfferCode(String msisdn) {

//   String subscriptionResponse = '''
//   {
//     "msisdn" : "9239198010",
//     "respCode" : 0,
//     "message": "successful",
//     "offers": [
//       {
//         "offerName": "CRBT_STANDARD_WEEKLY_REC",
//         "offerStatus": "A",
//         "expiryDate": "2024-08-15 15:05:18",
//         "chargedAmount" : "34.00",
//         "chargedDate" : "2024-07-18 15:05:18",
//         "chargedValidity" : "28",
//         "activationChannel" : "2",
//         "userPreferredLanguage" : "en",
//         "groupId" : "1",
//         "firstActivationDate" : "2024-07-11 15:05:35"
//       },
//       {
//         "offerName": "45",
//         "offerStatus": "A",
//         "expiryDate": "2024-08-15 15:05:18",
//         "chargedAmount" : "34.00",
//         "chargedDate" : "2024-07-18 15:05:18",
//         "chargedValidity" : "28",
//         "activationChannel" : "2",
//         "userPreferredLanguage" : "en",
//         "groupId" : "7",
//         "firstActivationDate" : "2024-08-18 14:15:26"
//       }
//     ]
//   }
//   ''';
//   Map<String, dynamic> responseMap = jsonDecode(subscriptionResponse);
//   List<dynamic> offers = responseMap['offers'];
//   for (var offer in offers) {
//     if (offer['offerStatus'] == "A") {
//       return offer['offerName']; 
//     }
//   }

//   return null; 
// }

// Future<ConsentModel> consent(String phoneNumber, {String? offerCode, String? contentId}) async {
 
//   String url = 'http://10.0.10.33:3214/selfcare/consent/fetch-details';

  
//   offerCode ??= extractOfferCode(phoneNumber); 

  
//   Map<String, dynamic> jsonData = {
//     "msisdn": phoneNumber,
//     //"92000022",

//     if (offerCode != null) "offerCode": offerCode,
//     if (contentId != null) "contentId": contentId,
//   };

//   print("Request Body: $jsonData");

  
//   Map<String, dynamic> jsonMap = await NetworkManager().postResquest(url, jsonData);

 
//   ConsentModel modal = ConsentModel.fromJson(jsonMap);

//   print("modal = ${modal.message}");


//   return modal;
// }