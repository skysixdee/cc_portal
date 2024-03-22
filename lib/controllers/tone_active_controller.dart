// import 'package:dio/dio.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// //import 'package:dio/dio.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
// import 'package:get/state_manager.dart';
// import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
// import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
// import 'package:sm_admin_portal/utilily/strings.dart';

// import 'package:get/get.dart';
// import 'package:dio/dio.dart';

// class ToneActivationScreen extends StatefulWidget {
//   ToneActivationScreen({Key? key}) : super(key: key);

//   @override
//   State<ToneActivationScreen> createState() => _ToneActivationScreenState();

// }

// class ToneActiveController extends GetxController {
//   bool isFrequencySelected = false;

//   RxList<Widget> widgetList = <Widget>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     createListOfWidget();
//   }

//   void createListOfWidget() {
//     widgetList.value = [
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Msisdn",
//         hintText: 'Msisdn',
//         onChange: (p0) {
//           onChangeMsisdn(p0);
//         },
//         onSubmit: (p0) {
//           onChangeMsisdn(p0);
//         },
//       ),
// ReusbaleDropDownButton(
//   items: ["ToneId", "ToneName", "Artist"],
//   title: "Category",
//   onTap: () {},
//   onChanged: (value) {
//     if (value == 0) {
//       print("Tone id tapped");

//       widgetList[2] = CustomReusableTextField(
//         textController: TextEditingController(),
//         title: toneIdStr,
//         hintText: toneIdStr,
//         onChange: (p0) {
//           print("Changed");
//         },
//       );
//     } else if (value == 1) {
//       print("Tone name tapped");
//       widgetList[2] = CustomReusableTextField(
//         textController: TextEditingController(),
//         title: ToneNameStr,
//         hintText: ToneNameStr,
//         onChange: (p0) {
//           print("Changed");
//         },
//       );
//     } else if (value == 2) {
//       print("Artist tapped");
//       widgetList[2] = CustomReusableTextField(
//         textController: TextEditingController(),
//         title: ArtistStr,
//         hintText: ArtistStr,
//         onChange: (p0) {
//           print("Changed");
//         },
//       );
//     }
//     print("Value is $value");
//   },
// ),
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Search Key",
//         hintText: 'Search Key',
//         onChange: (p0) {
//           print("Changed");
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: ["Daily", "Weekly", "Monthly"],
//         title: "Frequency",
//         onChanged: (p0) {
//           updateStatus();
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tone",
//           "Promotional Pack and Tone"
//         ],
//         title: "Service Type",
//         onChanged: (value) {},
//       ),
//     ];
//   }

//   void onChangeMsisdn(String value) {
//     print("Value is $value");
//   }

//   void updateStatus() {
//     print("Items are ${widgetList.length}");
//     if (!isFrequencySelected) {
//       print('object');
//       addNewField();
//       // Make API call for Tone options when Weekly is selected
//       makeApiCallForToneOptions();
//     }
//     isFrequencySelected = true;
//   }

//   void addNewField() {
//     widgetList.add(
//       ReusbaleDropDownButton(
//         items: ["CRBT"],
//         title: "Offers",
//         onChanged: (value) {},
//       ),
//     );

//     widgetList.add(ReusbaleDropDownButton(
//       items: ["CANT STOP NOW"],
//       title: "Tone",
//       onChanged: (value) {},
//     ));
//     widgetList.add(
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tune",
//           "Promotional Pack and tune"
//         ],
//         title: "Language",
//         onChanged: (value) {},
//       ),
//     );
//   }

//   void makeApiCallForToneOptions() {
//     // Replace "your_api_url_here" with your actual API endpoint
//     String apiUrl = "your_api_url_here";

//     // Make the API call
//     Dio dio = Dio();
//     dio.get(apiUrl).then((response) {
//       // Parse the response data
//       var responseData = response.data;

//       // Extract tone options from the response
//       List<dynamic> toneData = responseData['data'][0]['tones'];
//       List<String> toneOptions =
//           toneData.map<String>((tone) => tone['toneNameEnglish']).toList();

//       // Find the index of the existing ReusableDropDownButton in the widget list
//       int toneIndex = -1;
//       for (int i = 0; i < widgetList.length; i++) {
//         if (widgetList[i] is ReusbaleDropDownButton &&
//             (widgetList[i] as ReusbaleDropDownButton).title == "Tone") {
//           toneIndex = i;
//           break;
//         }
//       }

//       // Update the Tone dropdown with the retrieved options
//       if (toneOptions.isNotEmpty && toneIndex != -1) {
//         ReusbaleDropDownButton toneDropdown =
//             widgetList[toneIndex] as ReusbaleDropDownButton;
//         toneDropdown.items = toneOptions;
//         widgetList[toneIndex] = toneDropdown;
//       }
//     }).catchError((error) {
//       print("Error fetching Tone options: $error");
//     });
//   }
// }

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

// class ToneActiveController extends GetxController {
//   bool isFrequencySelected = false;
//   RxList<Widget> widgitList = <Widget>[].obs;

//   void onInit() {
//     super.onInit();
//     createListOfWidget();
//   }

//   createListOfWidget() {
//     widgitList.value = [
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Msisdn",
//         hintText: 'Msisdn',
//         onChange: (p0) {
//           onChangeMsisdn(p0);
//         },
//         onSubmit: (p0) {
//           onChangeMsisdn(p0);
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: ["ToneId", "ToneName", "Artist"],
//         title: "Category",
//         onTap: () {},
//         onChanged: (value) {
//           if (value == 0) {
//             print("Tone id tapped");

//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: toneIdStr,
//               hintText: toneIdStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           } else if (value == 1) {
//             print("Tone name tapped");
//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: ToneNameStr,
//               hintText: ToneNameStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           } else if (value == 2) {
//             print("Artist tapped");
//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: ArtistStr,
//               hintText: ArtistStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           }
//           print("Value is $value");
//         },
//       ),
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Search Key",
//         hintText: 'Search Key',
//         onChange: (p0) {
//           print("Changed");
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: ["Daily", "Weekly", "Montly"],
//         title: "Frequeny",
//         onChanged: (p0) {
//           updateStatus();
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           " Promotional Tune",
//           "Promotional Pack and Tone"
//         ],
//         title: "Service Type",
//         onChanged: (value) {},
//       ),
//     ];
//   }

//   onChangeMsisdn(String value) {
//     print("Value is $value");
//   }

//   updateStatus() {
//     print("Items are ${widgitList.length}");
//     if (!isFrequencySelected) {
//       addNewField();
//     }
//     isFrequencySelected = true;
//   }

//   addNewField() {
//     widgitList.add(
//       ReusbaleDropDownButton(
//         items: ["CRBT"],
//         title: "Offers",
//         onChanged: (value) {},
//       ),
//     );

//     widgitList.add(ReusbaleDropDownButton(
//       items: [
//         "Promotional Pack",
//         "Promotional Tune",
//         "Promotional Pack and tune"
//       ],
//       title: "Tone",
//       onChanged: (value) {},
//     ));
//     widgitList.add(
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tune",
//           "Promotional Pack and tune"
//         ],
//         title: "Language",
//         onChanged: (value) {},
//       ),
//     );
//   }
// }
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ToneActiveController extends GetxController {
  bool isFrequencySelected = false;

  RxList<Widget> widgetList = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    createListOfWidget();
  }

  void createListOfWidget() {
    widgetList.value = [
      CustomReusableTextField(
        textController: TextEditingController(),
        title: "Msisdn",
        hintText: 'Msisdn',
        onChange: (p0) {
          onChangeMsisdn(p0);
        },
        onSubmit: (p0) {
          onChangeMsisdn(p0);
        },
      ),
      ReusbaleDropDownButton(
        items: ["ToneId", "ToneName", "Artist"],
        title: "Category",
        onTap: () {},
        onChanged: (value) {
          if (value == 0) {
            print("Tone id tapped");

            widgetList[2] = CustomReusableTextField(
              textController: TextEditingController(),
              title: toneIdStr,
              hintText: toneIdStr,
              onChange: (p0) {
                print("Changed");
              },
            );
          } else if (value == 1) {
            print("Tone name tapped");
            widgetList[2] = CustomReusableTextField(
              textController: TextEditingController(),
              title: ToneNameStr,
              hintText: ToneNameStr,
              onChange: (p0) {
                print("Changed");
              },
            );
          } else if (value == 2) {
            print("Artist tapped");
            widgetList[2] = CustomReusableTextField(
              textController: TextEditingController(),
              title: ArtistStr,
              hintText: ArtistStr,
              onChange: (p0) {
                print("Changed");
              },
            );
          }
          print("Value is $value");
        },
      ),
      CustomReusableTextField(
        textController: TextEditingController(),
        title: "Search Key",
        hintText: 'Search Key',
        onChange: (p0) {
          print("Changed");
        },
      ),
      ReusbaleDropDownButton(
        items: ["Daily", "Weekly", "Monthly"],
        title: "Frequency",
        onChanged: (p0) {
          updateStatus();
        },
      ),
      ReusbaleDropDownButton(
        items: [
          "Promotional Pack",
          "Promotional Tone",
          "Promotional Pack and Tone"
        ],
        title: "Service Type",
        onChanged: (value) {},
      ),
    ];
  }

  void onChangeMsisdn(String value) {
    print("Value is $value");
  }

  void updateStatus() {
    print("Items are ${widgetList.length}");
    if (!isFrequencySelected) {
      print('object');
      addNewField();
    }
    isFrequencySelected = true;

    
    if (widgetList[3] is ReusbaleDropDownButton &&
        (widgetList[3] as ReusbaleDropDownButton).title == "Frequency" &&
        (widgetList[3] as ReusbaleDropDownButton).value == "Weekly" &&
        widgetList[6] is CustomReusableTextField &&
        (widgetList[2] as CustomReusableTextField).title == "ToneId" &&
        (widgetList[0] as CustomReusableTextField).textController.text ==
            "90238442") {
      makeApiCallForToneOptions("90238442", "832008988");
    }
  }

  void addNewField() {
    widgetList.add(
      ReusbaleDropDownButton(
        items: ["CRBT"],
        title: "Offers",
        onChanged: (value) {},
      ),
    );

    widgetList.add(ReusbaleDropDownButton(
      items: ["CANT STOP NOW"],
      title: "Tone",
      onChanged: (value) {},
    ));
    widgetList.add(
      ReusbaleDropDownButton(
        items: [
          "Promotional Pack",
          "Promotional Tune",
          "Promotional Pack and tune"
        ],
        title: "Language",
        onChanged: (value) {},
      ),
    );
  }

  void makeApiCallForToneOptions(String toneId, String msidn) {
    String apiUrl =
        "https://ringtune.mtn.co.za/crbt-gateway/BL/contentManagement/toneDetails?categoryType=toneName&categoryValue=CAN%E2%80%99T%20STOP%20NOW&frequency=Weekly";

    // Make the API call with toneId and msidn
    Dio dio = Dio();
    dio.get(apiUrl, queryParameters: {"toneId": toneId, "msidn": msidn}).then(
        (response) {
     
      var responseData = response.data;

      List<dynamic> toneData = responseData['data'][0]['tones'];
      List<String> toneOptions =
          toneData.map<String>((tone) => tone['toneNameEnglish']).toList();

      int toneIndex = -1;
      for (int i = 0; i < widgetList.length; i++) {
        if (widgetList[i] is ReusbaleDropDownButton &&
            (widgetList[i] as ReusbaleDropDownButton).title == "Tone") {
          toneIndex = i;
          break;
        }
      }

      if (toneOptions.isNotEmpty && toneIndex != -1) {
        ReusbaleDropDownButton toneDropdown =
            widgetList[toneIndex] as ReusbaleDropDownButton;
        toneDropdown.items = toneOptions;
        widgetList[toneIndex] = toneDropdown;
      }
    }).catchError((error) {
      print("Error fetching Tone options: $error");
    });
  }
}
