import 'dart:convert';

//import 'package:http/http.dart' as http; // Import http package for making HTTP requests
import 'package:sm_admin_portal/Models/copy_tone_modal.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<CopyToneDetailModal> getCopyToneDetailApi() async {
  //String url = 'http://10.0.10.33:8085/selfcare/subscriber-management/list-tones';

  // Map<String, dynamic> jsonData = {
  //   "transactionId": "",
  //   "featureId": "1",
  //   "msisdn": "",
  //   "offerCode": "",
  //   "languageCode": "",
  //   "channelId": "",
  // };

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
    await Future.delayed(Duration(seconds: 1));
    return CopyToneDetailModal.fromJson(respMap);
  } catch (e) {
    // throw Exception('Failed to connect to the server: $e');
    return CopyToneDetailModal(message: 'Failed to connect to the server');
  }
}

String toneDetailResp = """{
    "respCode": 0,
    "message": "successful",
    "tonelist": [
        {
            "id": "2194854",
            "msisdn": "832008988",
            "subscriptionCode": "832008988",
            "toneStatus": "A",
            "activationDate": "2024-02-21 12:42:04",
            "toneNextBillingDate": "2024-03-21",
            "offerCode": "CRBT",
            "cpId": "601902",
            "cpName": "Ziiki Majors",
            "activationType": "FREE",
            "toneId": "601902000000014504",
            "language": "ENGLISH",
            "toneName": "Gods Plan",
            "channelId": "USSD"
        },
        {
            "id": "2194856",
"msisdn": "832008988",
"subscriptionCode": "832008988",
"toneStatus": "A",
"activationDate": "2024-02-21 12:43:02",
"toneNextBillingDate": "2024-03-21",
"offerCode": "CRBT",
"cpId": "601906",
"cpName":"SONY",
"activationType": "FREE",
"toneId": "601906000000029760",
"language": "ENGLISH",
"toneName": "Back To The Beach",
"channelId": "USSD"
        },
        {
           "id": "2208288",
"msisdn": "832008988",
"subscriptionCode": "832008988",
"toneStatus": "A",
"activationDate": "2024-02-29 12:29:36",
"toneNextBillingDate": "2024-03-22",
"offerCode": "CRBT",
"cpId": "601997",
"cpName": "Ziiki Independents",
"activationType": "FREE",
"toneId": "601997000000017958",
"language": "ENGLISH",
"toneName": "Shape of You",
"channelId": "MTN play"
        },
        {
           "id": "2211670",
"msisdn": "832008988",
"subscriptionCode": "832008988",
"toneStatus": "A",
"activationDate": "2024-03-02 12:57:41",
"toneNextBillingDate": "2024-04-02",
"offerCode": "CRBT",
"cpId": "601991",
"cpName": "Content Connect Africa",
"activationType": "FREE",
"toneId": "99119347",
"language": "ENGLISH",
"toneName": "TSHWALA BAMI",
"channelId": "USSD"
        },
        {
           "id": "2227126",
"msisdn": "832008988",
"subscriptionCode": "832008988",
"toneStatus": "A",
"activationDate": "2024-03-13 18:33:03",
"toneNextBillingDate": "2024-04-13",
"offerCode": "CRBT",
"cpId": "601991",
"cpName": "Content Connect Africa",
"activationType": "FREE",
"toneId": "99136979",
"language": "ENGLISH",
"toneName": "IMITHANDAZO",
"channelId": "SMS"
},
{
 "id": "2233629",
"msisdn": "832008988",
"subscriptionCode": "832008988",
"toneStatus": "A",
"activationDate": "2024-03-18 08:21:17",
"toneNextBillingDate": "2024-04-18",
"offerCode": "CRBT",
"cpId": "601991",
"cpName": "Content Connect Africa",
"activationType": "FREE",
"toneId": "601991000000005076",
"language": "ENGLISH",
"toneName": "Call Out",
"channelId": "USSD"
}
    ]
}

""";
