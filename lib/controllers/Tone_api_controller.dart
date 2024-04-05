// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ToneActiveController extends GetxController {
//   var widgitList = [].obs;

//   get responseData => null;

//   void fetchTones(String msisdn, String toneId) {
   
//     var tonesData = responseData['data'];
//     if (tonesData != null && tonesData.isNotEmpty) {
//       var tones = tonesData[0]['tones'];
//       if (tones != null && tones.isNotEmpty) {
//         // Extract tone details
//         var tone = tones[0];
//         var toneName = tone['toneNameEnglish'];
//         var location = tone['location'];
//         var album = tone['albumEnglish'];
//         var artist = tone['artistEnglish'];
//         var toneId = tone['toneId'];

//         // Update the Tone field
//         var toneOption = '$toneName - $album by $artist';
//         var toneUrl =
//             'https://ringtune.mtn.co.za/crbt-gateway/BL/contentManagement/toneDetails?categoryType=toneName&categoryValue=$toneName&frequency=Weekly';

//         // Add the tone option to the list
//         widgitList.clear();
//         widgitList.add(
//           TextButton(
//             onPressed: () {
//               // Handle selection if needed
//             },
//             child: Text(
//               toneOption,
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//         );

//         // Optionally, you can store tone details like URL for further use
//         // For now, I'm just printing it
//         print('Tone Option: $toneOption');
//         print('Tone URL: $toneUrl');
//       }
//     }
//   }
// }
