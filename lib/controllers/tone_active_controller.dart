import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/utilily/strings.dart';



import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class ToneActiveController extends GetxController {
  bool isFrequencySelected = false;
  RxList<Widget> widgitList = <Widget>[].obs;

  void onInit() {
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
          if (value == "Weekly") {
            fetchToneDetails(
              (widgitList[0] as CustomReusableTextField).textController.text,
              (widgitList[2] as CustomReusableTextField).textController.text,
            );
            print('value:$value');
          }
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
        (widgitList[3] as ReusbaleDropDownButton).selectedItem;

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
    try {
      final response = await http.post(
        Uri.parse(
            'https://ringtune.mtn.co.za/crbt-gateway/BL/contentManagement/toneDetails?categoryType=toneName&categoryValue=CAN%E2%80%99T%20STOP%20NOW&frequency=Weekly'),
        body: json.encode({'msisdn': msisdn, 'toneId': toneId}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        print('Response Data: $responseData');

        var tones = responseData['data'][0]['tones'];
        if (tones.isNotEmpty) {
          var toneName = tones[0]['toneNameEnglish'];
          print('Tone Name: $toneName');

          (widgitList[4] as ReusbaleDropDownButton).items = [toneName];

          var artistName = tones[0]['artistEnglish'];
          print('Artist Name: $artistName');

          (widgitList[5] as ReusbaleDropDownButton).items = [artistName];
        } else {
          print('No tones found in the response');
        }
      } else {
        print('Failed to fetch tone details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching tone details: $e');
    }
  }
}
