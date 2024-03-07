/*import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deletePackApi(String offerName) async {
  String url = deletepackurl;

  Map<String, dynamic> jsondata = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "offerId": "",
    "offerName": "",
    "channelId": "",
  };
  Map<String, dynamic> jsonrequ =
      await NetworkManager().postResquest(url, jsondata);
  GenericModal modal = GenericModal.fromJson(jsonrequ);
  return modal;
}

String responString = """{
"respCode" : 0,
 "message" : "successful"
}
""";*/

/*import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';



Future<GenericModal> deletePackApi(String offerName) async {
  String url = deletepackurl;

  Map<String, dynamic> jsondata = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "offerId": "", 
    "offerName": offerName, 
    "channelId": "",
  };

  try {
    // Send the request to the server
    Map<String, dynamic> jsonResponse = await NetworkManager().postResquest(url, jsondata);
     GenericModal modal = GenericModal.fromJson(jsonResponse);
    print('Delete API Response: $modal');
    return modal;
    
   
  } catch (e) {
    
    print('Error in deletePackApi: $e');
    throw e; 
  }
}
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

Future<GenericModal> deletePackApi(String offerName) async {
  String url = deletepackurl;

  Map<String, dynamic> jsonData = {
    "transactionId": "",
    "featureId": "1",
    "msisdn": "",
    "offerId": "",
    "offerName": offerName,
    "channelId": "",
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(jsonData),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      
      Map<String, dynamic> respMap = json.decode(response.body);
      return GenericModal.fromJson(respMap);
    } else {
     
      throw Exception('Failed to delete pack: ${response.statusCode}');
    }
  } catch (e) {
    
    
    return GenericModal(message: 'Failed to connect to the server');
  }
}
String responString = """{
"respCode" : 0,
 "message" : "successful"
}
""";
