import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/History_gift_model.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_controller.dart';
import 'package:sm_admin_portal/enums/visiblity_type.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistoryGiftTableController extends GetxController {
  RxList<List<CustomTableViewModel>> giftList =
      <List<CustomTableViewModel>>[].obs;
  HistoryController con = Get.find();
  @override
  void onInit() {
    createHeaderColumnList();

    super.onInit();
  }

  makeApiCall() async {
    if (giftList.length > 1) {
      print("Empyt==============");
      return;
    }
    await Future.delayed(Duration(milliseconds: 20));
    con.visibilityType.value = VisibilityType.loading;
    String url = '';
    Map<String, dynamic> jsonData = {};
    // Map<String, dynamic> respData = await NetworkManager().postResquest(url, jsonData);
    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> respData = json.decode(_gift);
    HistoryGiftModel model = HistoryGiftModel.fromJson(respData);
    if (model.data != null) {
      giftList.clear();
      createHeaderColumnList();
      createRowList(model.data ?? []);
      con.visibilityType.value = VisibilityType.loaded;
    }
  }

  createHeaderColumnList() {
    giftList.add([
      CustomTableViewModel(title: timeStampStr, isVisible: true.obs),
      CustomTableViewModel(title: msisdnCStr, isVisible: true.obs),
      CustomTableViewModel(title: toneIdStr, isVisible: true.obs),
      CustomTableViewModel(title: toneNameStr, isVisible: true.obs),
      CustomTableViewModel(
          title: callChargeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: basicCauseStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList(List<Datum> data) {
    if (data.isEmpty) return;
    for (var info in data) {
      // }
      // for (var i = 0; i < 10; i++) {
      giftList.add(
        [
          CustomTableViewModel(
              value: info.subscriptionDate ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.aParty ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.toneId ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.englishToneName ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.callCharge ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.basicCause ?? '', isVisible: true.obs),
        ],
      );
    }
  }
}

String _gift = """{
    "total": "757",
    "data": [
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-18 08:22:12",
            "AParty": "832008988",
            "ToneId": "99116244",
            "EnglishToneName": "ANDIKALIBALI",
            "CallCharge": "0",
            "BasicCause": "668"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-18 08:21:17",
            "AParty": "832008988",
            "ToneId": "601991000000005076",
            "EnglishToneName": "Call Out",
            "CallCharge": "0",
            "BasicCause": "662"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-13 18:33:03",
            "AParty": "832008988",
            "ToneId": "99136979",
            "EnglishToneName": "IMITHANDAZO",
            "CallCharge": "0",
            "BasicCause": "662"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-07 09:59:56",
            "AParty": "832008988",
            "ToneId": "99118980",
            "EnglishToneName": "ULELE",
            "CallCharge": "0",
            "BasicCause": "662"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-02 12:59:24",
            "AParty": "832008988",
            "ToneId": "99725245",
            "EnglishToneName": "ULALA KANJANI",
            "CallCharge": "0",
            "BasicCause": "668"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-02 12:58:51",
            "AParty": "832008988",
            "ToneId": "99120988",
            "EnglishToneName": "LOVE NWANTINTI",
            "CallCharge": "0",
            "BasicCause": "668"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-02 12:57:41",
            "AParty": "832008988",
            "ToneId": "99119347",
            "EnglishToneName": "TSHWALA BAMI",
            "CallCharge": "0",
            "BasicCause": "662"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-01 06:55:17",
            "AParty": "832008988",
            "ToneId": "601906000000022845",
            "EnglishToneName": "Please Mr",
            "CallCharge": "0",
            "BasicCause": "668"
        }
    ]
}""";
