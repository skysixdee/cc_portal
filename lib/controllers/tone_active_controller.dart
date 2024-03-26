import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/Models/tone_search_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class ToneActiveController extends GetxController {
  bool isFrequencySelected = false;
  RxList<Widget> widgitList = <Widget>[].obs;
  int categoryIndex = 0;
  List<Tone> toneList = [];
  void onInit() {
    categoryIndex = -1;
    super.onInit();
    createListOfWidget();
  }

  createListOfWidget() {
    widgitList.value = [
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
        Function: () {},
        onChanged: (value) {},
        isrequired: true,
      ),
      ReusbaleDropDownButton(
        items: ["ToneId *", "ToneName", "Artist"],
        title: "Category",
        onTap: () {},
        onChanged: (value) {
          categoryIndex = value;
          if (value == 0) {
            print("Tone id tapped");

            widgitList[2] = CustomReusableTextField(
                textController: TextEditingController(),
                title: toneIdStr,
                hintText: toneIdStr,
                onChange: (p0) {
                  print("Changed");
                },
                Function: () {},
                onChanged: (value) {},
                isrequired: true);
          } else if (value == 1) {
            print("Tone name tapped");
            widgitList[2] = CustomReusableTextField(
              textController: TextEditingController(),
              title: ToneNameStr,
              hintText: ToneNameStr,
              onChange: (p0) {
                print("Changed");
              },
              Function: () {},
              onChanged: (value) {},
              isrequired: true,
            );
          } else if (value == 2) {
            print("Artist tapped");
            widgitList[2] = CustomReusableTextField(
              textController: TextEditingController(),
              title: ArtistStr,
              hintText: ArtistStr,
              onChange: (p0) {
                print("Changed");
              },
              Function: () {},
              onChanged: (value) {},
              isrequired: true,
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
        Function: () {},
        onChanged: (value) {},
        isrequired: false,
      ),
      ReusbaleDropDownButton(
        items: ["Daily", "Weekly", "Montly"],
        title: "Frequeny",
        onChanged: (value) {
          updateStatus();
          //if (value == "Weekly") {
          fetchToneDetails(
            (widgitList[0] as CustomReusableTextField).textController.text,
            (widgitList[2] as CustomReusableTextField).textController.text,
          );
          print('value:$value');
          //}
        },
      ),
      ReusbaleDropDownButton(
        items: [
          "Promotional Pack",
          " Promotional Tune",
          "Promotional Pack and Tone"
        ],
        title: "Service Type",
        onChanged: (value) {
          print('value=$value');
        },
      ),
    ];
  }

  onChangeMsisdn(String value) {
    print("Value is $value");
  }

  updateStatus() {
    print("Items are ${widgitList.length}");
    bool msisdnNotEmpty = (widgitList[0] as CustomReusableTextField)
        .textController
        .text
        .isNotEmpty;
    bool toneIdNotEmpty = (widgitList[2] as CustomReusableTextField)
        .textController
        .text
        .isNotEmpty;

    String? selectedFrequency =
        (widgitList[3] as ReusbaleDropDownButton).selectedText.value;

    print('MSISDN NOT EMPTY:$msisdnNotEmpty');
    print('ToneId NOT EMPTY:$toneIdNotEmpty');
    print('Selected frequency:$selectedFrequency');

    if (msisdnNotEmpty && toneIdNotEmpty && !isFrequencySelected) {
      print('object');
      addNewField();
    }
    isFrequencySelected = false;
  }

  addNewField() {
    ReusbaleDropDownButton offersDropDown =
        // widgitList.add(
        ReusbaleDropDownButton(
      items: ["CRBT"],
      title: "Offers",
      onChanged: (value) {},
    );

    //   widgitList.add(
    ReusbaleDropDownButton toneDropDown = ReusbaleDropDownButton(
      items: [],
      title: "Tone",
      onChanged: (value) {},
    );
    ReusbaleDropDownButton languageDropDown =
        // widgitList.add(
        ReusbaleDropDownButton(
      items: [
        "Promotional Pack",
        "Promotional Tune",
        "Promotional Pack and tune"
      ],
      title: "Language",
      onChanged: (value) {},
    );
    widgitList.add(offersDropDown);
    widgitList.add(toneDropDown);
    widgitList.add(languageDropDown);
    widgitList.refresh();
  }

  Future<void> fetchToneDetails(String msisdn, String toneId) async {
    if (categoryIndex == 0) {
      print("Make search tone id api call here");
      Map<String, dynamic> jsonResp = json.decode(toneIdSearchResp);
      ToneSearchModel model = ToneSearchModel.fromJson(jsonResp);
      toneList = model.data?.first.tones ?? [];
      print("Tone items are ${toneList.length}");
      //if(model.data)
    } else if (categoryIndex == 1) {
      print("Make tone name api call here");
      Map<String, dynamic> jsonResp = json.decode(toneNameSearchResp);
      ToneSearchModel model = ToneSearchModel.fromJson(jsonResp);
      toneList = model.data?.first.tones ?? [];
      print("Tone items are ${toneList.length}");
    } else {
      Map<String, dynamic> jsonResp = json.decode(artistSearchResp);
      ToneSearchModel model = ToneSearchModel.fromJson(jsonResp);
      toneList = model.data?.first.tones ?? [];
      print("Make Artist search api call here");
      print("Tone items are ${toneList.length} ===== ${model.data}");
    }
    // if (index == 0) {
    //   print("Make daily api call here");
    // } else if (index == 1) {
    //   print("Make weekly api call here");
    // } else {
    //   print("Make Monthly api call here");
    // }
  }
}

String toneNameSearchResp = """
{
    "count": 0,
    "data": [
        {
            "tones": [
                {
                    "toneNameEnglish": "CAN’T STOP NOW",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0795802570134189aud30s_5508433228487077071.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90238442"
                },
                {
                    "toneNameEnglish": "Copy CAN’T STOP NOW",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0795802570134189aud30s_5508433228487077071.mp3",
                    "albumEnglish": "Copy LI RYE",
                    "artistEnglish": "Copy LI RYE",
                    "contentProviderName": "Copy Ziiki Majors",
                    "toneId": "90238442"
                }
            ],
            "offers": [
                {
                    "offerCode": "CRBT",
                    "offerName": "CRBT"
                }
            ]
        }
    ],
    "total": 0
}
""";

String artistSearchResp = """
{
    "count": 0,
    "data": [
        {
            "tones": [
                {
                    "toneNameEnglish": "CAN’T STOP NOW",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0795802570134189aud30s_5508433228487077071.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90238442"
                },
                {
                    "toneNameEnglish": "PAIN MUSIC",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0795761780134189aud30s_3337266779180519464.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90238416"
                },
                {
                    "toneNameEnglish": "BROKE ASF",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0777703360134189aud30s_2722148147127680334.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90238226"
                },
                {
                    "toneNameEnglish": "DID BOUT THAT",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/OCT23/A063009226aud30s_1576567978864088257.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90230146"
                },
                {
                    "toneNameEnglish": "RACKS (FEAT. ANTI DA MENACE)",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/AUG23/A063012919aud30s_5970965641162415412.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90223121"
                },
                {
                    "toneNameEnglish": "FACESHOT (FEAT. SETT)",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/AUG23/A063004586aud30s_860293488868280584.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90225140"
                }
            ],
            "offers": [
                {
                    "offerCode": "CRBT",
                    "offerName": "CRBT"
                }
            ]
        }
    ],
    "total": 0
}""";

String toneIdSearchResp = """{
    "count": 0,
    "data": [
        {
            "tones": [
                {
                    "toneNameEnglish": "CAN’T STOP NOW",
                    "location": "/opt/crbtuser/content/CP_STORE_PATH/CONTENT/601902/Audio/MAR24/A0795802570134189aud30s_5508433228487077071.mp3",
                    "albumEnglish": "LI RYE",
                    "artistEnglish": "LI RYE",
                    "contentProviderName": "Ziiki Majors",
                    "toneId": "90238442"
                }
            ],
            "offers": [
                {
                    "offerCode": "CRBT",
                    "offerName": "CRBT"
                }
            ]
        }
    ],
    "total": 0
}""";
