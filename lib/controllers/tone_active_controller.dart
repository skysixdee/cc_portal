import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/Models/tone_search_model.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ToneActiveController extends GetxController {
  bool isFrequencySelected = false;
  RxList<Widget> widgitList = <Widget>[].obs;
  int categoryIndex = 0;
  // List<Tone> toneList = [];//////////bhavya
  List<Tonelist> toneList = [];
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
        direction: PopoverDirection.bottom,
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
          //if (categoryIndex == 0) {
          fetchToneDetails(
            categoryIndex,
            (widgitList[0] as CustomReusableTextField).textController.text,
            (widgitList[2] as CustomReusableTextField).textController.text,
          );
          //}

          print('value:$value');
          //}
        },
        direction: PopoverDirection.bottom,
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
        direction: PopoverDirection.bottom,
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
      direction: PopoverDirection.bottom,
    );

    //   widgitList.add(
    ReusbaleDropDownButton toneDropDown = ReusbaleDropDownButton(
      items: [],
      title: "Tone",
      onChanged: (value) {},
      direction: PopoverDirection.bottom,
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
      direction: PopoverDirection.bottom,
    );
    widgitList.add(offersDropDown);
    widgitList.add(toneDropDown);
    widgitList.add(languageDropDown);
    widgitList.refresh();
  }

  Future<void> fetchToneDetails(
      int categoryIndex, String msisdn, String key) async {
    String url = 'http://10.0.14.4:8090/advanced-search';

    print("Make search tone id api call here");
    var myPost = {
      "msisdn": msisdn,
      "sortBy": "OrderBy",
      "pageNo": 0,
      "perPageCount": 20,
      "filter": (categoryIndex == 0)
          ? "ToneId"
          : ((categoryIndex == 1) ? "Content" : "Artist",),
      "filterPref": "none",
      "locale": "my",
      "searchKey": [key],
    };
    Map<String, dynamic> respMap =
        await NetworkManager().postResquest(url, myPost);

    //Map<String, dynamic> jsonResp = json.decode(respMap);
    ToneActivationModall model = ToneActivationModall.fromJson(respMap);
    print("Model ====== ${model}");

    print("tones are ${model.responseMap?.toneList}");
    List<String> toneNames = (model.responseMap?.toneList ?? [])
        .map<String>((tone) => tone.toneNameEnglish ?? '')
        .toList();

    ReusbaleDropDownButton toneDropdown =
        widgitList[6] as ReusbaleDropDownButton;
    toneDropdown.items = toneNames;

    if (categoryIndex == 0) {
      print("Update for tone id ");
    } else if (categoryIndex == 1) {
      print("Update for tone name ");
    } else {
      var jsonResponse = json.decode(respMap as String);
      List<dynamic> toneList = jsonResponse['responseMap']['toneList'];
      List<String> artistNames =
          toneList.map<String>((tone) => tone['artistName'] ?? '').toList();
      print("Update for artist ");

      ReusbaleDropDownButton artistDropdown =
          widgitList[8] as ReusbaleDropDownButton;
      artistDropdown.items = artistNames;
    }
    // toneList = model.responseMap?.toneList ?? [];
    // print("Tone items are ${model.data}");

    // List<String> toneNames =
    //     toneList.map((tone) => tone.toneNameEnglish!.toString()).toList();
    // ReusbaleDropDownButton toneDropdown =
    //     widgitList[6] as ReusbaleDropDownButton;
    // toneDropdown.items = toneNames;
    // widgitList.refresh();
    //print('tones:$toneNames');
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
    "responseMap": {
        "toneList": [
            {
                "toneId": "55588149",
                "toneName": "Baby U Miss U Cho",
                "artistName": "SKY Ngao Han Fa",
                "albumName": "Baby U Miss U",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=5onzZz5L79rfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=5onzZz5L79rfRp5KT5lW1Q=="
            },
            {
                "toneId": "55588150",
                "toneName": "Baby U Miss U Ver 1",
                "artistName": "SKY Ngao Han Fa",
                "albumName": "Baby U Miss U",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=7TszCS4nWVbfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=7TszCS4nWVbfRp5KT5lW1Q=="
            },
            {
                "toneId": "55586927",
                "toneName": "Di Kaung Ma Lay Cho",
                "artistName": "SKY Ngao Han Fa",
                "albumName": "Di Kaung Ma Lay",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=+3MW1DKC5FPfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=+3MW1DKC5FPfRp5KT5lW1Q=="
            },
            {
                "toneId": "55586928",
                "toneName": "Di Kaung Ma Lay Ver 1",
                "artistName": "SKY Ngao Han Fa",
                "albumName": "Di Kaung Ma Lay",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=QhHd8mB3f7rfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=QhHd8mB3f7rfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551133",
                "toneName": "Ma Nat Phyan Cho",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=6C5M/V8GrvnfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=6C5M/V8GrvnfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551134",
                "toneName": "Ma Nat Phyan Ver 1",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=TkiMuV7uTuXfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=TkiMuV7uTuXfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551137",
                "toneName": "Pyo Pyo Khin Cho",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=ijMR+SKiAyXfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=ijMR+SKiAyXfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551141",
                "toneName": "Myit Kyoe Inn Cho",
                "artistName": "Skye   Yan Htet",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=4BGyZWzG44XfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=4BGyZWzG44XfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551143",
                "toneName": "Sate Taza Myat Yay Cho",
                "artistName": "Skye   Yan Htet",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=C5GV9U+C2UbfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=C5GV9U+C2UbfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551145",
                "toneName": "Noe Tit Wat Eain Mat Cho",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=Z8GgPfbaNGLfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=Z8GgPfbaNGLfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551147",
                "toneName": "Sate Dat Htel Mhar Swel Cho",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=69Nv/2PRkUzfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=69Nv/2PRkUzfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551148",
                "toneName": "Sate Dat Htel Mhar Swel Ver 1",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=cjYn58E75sTfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=cjYn58E75sTfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551150",
                "toneName": "One Side RS Ver 1",
                "artistName": "Skye   WY   Douwin",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=xm8iDI6YaxPfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=xm8iDI6YaxPfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551151",
                "toneName": "Much Than Forever Cho",
                "artistName": "Skye   Douwin",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=+Ye0NHYt/affRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=+Ye0NHYt/affRp5KT5lW1Q=="
            },
            {
                "toneId": "55551152",
                "toneName": "Much Than Forever Ver 1",
                "artistName": "Skye   Douwin",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=rI5A2GIXEZXfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=rI5A2GIXEZXfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551153",
                "toneName": "Myaw Par Thwar Cho",
                "artistName": "Skye   Douwin",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=nlZxMKnMRxjfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=nlZxMKnMRxjfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551135",
                "toneName": "Mone Loh Pyaw Tar Ma Hote Cho",
                "artistName": "Skye   X Ray",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=NZZ7+yKUjn3fRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=NZZ7+yKUjn3fRp5KT5lW1Q=="
            },
            {
                "toneId": "55551136",
                "toneName": "Mone Loh Pyaw Tar Ma Hote Ver 1",
                "artistName": "Skye   X Ray",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=Sd/YRJKVzg/fRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=Sd/YRJKVzg/fRp5KT5lW1Q=="
            },
            {
                "toneId": "55551138",
                "toneName": "Pyo Pyo Khin Ver 1",
                "artistName": "Skye",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=CSuA7b/1E3LfRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=CSuA7b/1E3LfRp5KT5lW1Q=="
            },
            {
                "toneId": "55551139",
                "toneName": "Thit Sein Choe Cho",
                "artistName": "Skye   Dblade",
                "albumName": "Ma Nat Phyan",
                "price": 300,
                "categoryId": 3,
                "expiryDate": "Wed Dec 30 17:30:00 UTC 2037",
                "toneIdStreamingUrl": "https://funtone.ooredoo.com.mm/stream-media/get-tone-path?fileId=geBBU9dKbo7fRp5KT5lW1Q==",
                "toneIdpreviewImageUrl": "https://funtone.ooredoo.com.mm/stream-media/get-preview-image?fileId=geBBU9dKbo7fRp5KT5lW1Q=="
            }
        ]
    },
    "message": "Success",
    "respTime": "Response Time",
    "statusCode": "SC0000"
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
