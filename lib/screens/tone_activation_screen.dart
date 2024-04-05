import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/controllers/tone_active_controller.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class ToneActivationScreen extends StatefulWidget {
  ToneActivationScreen({Key? key}) : super(key: key);

  @override
  State<ToneActivationScreen> createState() => _ToneActivationScreenState();
}

class _ToneActivationScreenState extends State<ToneActivationScreen> {
  ToneActiveController con = Get.put(ToneActiveController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: boxShadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Obx(() {
                        return GridView.builder(
                            itemCount: con.widgitList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    mainAxisExtent: 70,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return con.widgitList[index];
                            });
                      })),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          _submitData();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blue,
                          ),
                          width: 80,
                          height: 33,
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          width: 80,
                          height: 35,
                          child: Center(
                            child: 
                            Text(
                              'Reset',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<GenericModal> _submitData() async {
  String url = 'http://10.0.10.33:5678/selfcare/subscriber-management/buy-tone';

  Map<String, dynamic> jsondata = {
    "transactionId": "456546575",
    "featureId": 1,
    "msisdn": "92000000",
    "offerCode": "01",
    "contentId": "58812662",
    "contentType": "1",
    "languageCode": "en",
    "channelId": 3,
   
  };

  Map<String, dynamic> jsonrequ =
      await NetworkManager().postResquest(url, jsondata);

//Map<String, dynamic> jsonrequ = json.decode(responString);
  await Future.delayed(Duration(seconds: 2));
  GenericModal modal = GenericModal.fromJson(jsonrequ);
  return modal;
}

String responString =

 """{
"respCode" : 0,
 "message" : "successful"
}

{
“respCode” : 1002,
 “message” : “The user does not belong to the operator”
}

{
“respCode” : 1016,
 “message” : “MSISDN Contain invalid characters”
}

{
“respCode” : 498,
 “message” : “token expired / invalid token”
}

{
“respCode” : 2000,
 “message” : “Tone already purchased”
}


""";





// void _submitData() async {
//   print('submitting data');
//   Map<String, dynamic> requestBody = {
//     "transaction": "transaction of the request",
//     "featureId": 1,
//     "msisdn": 1,
//     "channelId": 1,
//   };

//   try {
//     Map<String, dynamic>? response = await NetworkManager.post(
//         // 'http://10.0.14.4:8090/advanced-search';
//         "http://10.0.10.33:5678/selfcare/subscriber-management/buy-tone",
//         requestBody);
//     print('Api Response : $response');
//     if (response != null) {
//       if (response.containsKey('respCode')) {
//         if (response['responseCode'] == 0) {
//           print('  API REQUEST SUCCESSFULL');
//         } else {
//           print('api failed: ${response['message']}');
//         }
//       } else {
//         print('Unexpected response format: $response');
//       }
//     } else {
//       print('Api response was null');
//     }
//   } catch (e) {
//     print('hgf:$e');
//   }
// }



















// void _submitData() async {
//   try {
//     Map<String, dynamic>? data = await fetchData();

//     if (data != null) {
//       print(data['key']);
//     } else {
//       print('Data is null');
//     }
//   } catch (e) {
//     print('Error : $e');
//   }
// }

// Future<Map<String, dynamic>?> fetchData() async {
//   String apiUrl = '$baseUrl/selfcare/subscriber-management/buy-tone';
//   NetworkManager networkManager = NetworkManager();
//   var manager;
//   Response response = await manager.get(apiUrl);

//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = json.decode(response.body);
//     return data;
//   } else {
//     throw Exception('Failed to load data: ${response.statusCode}');
//   }
// }
