import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';

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
      ),
      ReusbaleDropDownButton(
        items: ["ToneId", "ToneName", "Artist"],
        title: "Category",
        onChanged: (value) {},
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
        items: ["Daily", "Weekly", "Montly"],
        title: "Frequeny",
        onChanged: (p0) {
          updateStatus();
        },
      ),
    ];
  }

  onChangeMsisdn(String value) {
    print("Value is $value");
  }

  updateStatus() {
    print("Items are ${widgitList.length}");
    if (!isFrequencySelected) {
      addNewField();
    }
    isFrequencySelected = true;
  }

  addNewField() {
    widgitList.add(
      ReusbaleDropDownButton(
        items: [
          "Promotional Pack",
          "Promotional Tune",
          "Promotional Pack and tune"
        ],
        title: "Service Type",
        onChanged: (value) {},
      ),
    );

    widgitList.add(ReusbaleDropDownButton(
      items: [
        "Promotional Pack",
        "Promotional Tune",
        "Promotional Pack and tune"
      ],
      title: "Offer",
      onChanged: (value) {},
    ));
    widgitList.add(
      ReusbaleDropDownButton(
        items: [
          "Promotional Pack",
          "Promotional Tune",
          "Promotional Pack and tune"
        ],
        title: "Tone",
        onChanged: (value) {},
      ),
    );
  }
}
