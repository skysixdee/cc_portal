import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/history_purchase_model.dart';
import 'package:sm_admin_portal/controllers/history_controllers/history_controller.dart';
import 'package:sm_admin_portal/enums/visiblity_type.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistoryPurchaseTableController extends GetxController {
  RxList<List<CustomTableViewModel>> purchaseList =
      <List<CustomTableViewModel>>[].obs;
  HistoryController con = Get.find();
  @override
  void onInit() {
    createHeaderColumnList();

    //createRowList();
    super.onInit();
  }

  makeApiCall() async {
    if (purchaseList.length > 1) {
      print("Empyt==============");
      return;
    }
    await Future.delayed(Duration(milliseconds: 20));
    con.visibilityType.value = VisibilityType.loading;
    String url = '';
    Map<String, dynamic> jsonData = {};
    // Map<String, dynamic> respData = await NetworkManager().postResquest(url, jsonData);
    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> respData = json.decode(_purchase);
    HistoryPurchaseModel model = HistoryPurchaseModel.fromJson(respData);
    if (model.data != null) {
      purchaseList.clear();
      createHeaderColumnList();
      createRowList(model.data ?? []);
      con.visibilityType.value = VisibilityType.loaded;
    }
  }

  createHeaderColumnList() {
    purchaseList.add([
      CustomTableViewModel(title: aPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: bPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: englishToneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: NextBillingDateStr, isVisible: true.obs),
      CustomTableViewModel(
          title: callChargeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: channelStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: subscriptionDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: basicCauseStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: toneTypeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: transactionTypeStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList(List<PurchaseInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      purchaseList.add(
        [
          CustomTableViewModel(value: info.aParty ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.bParty ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.englishToneName ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.nextBillingDate ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.callCharge ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.channel ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.subscriptionDate ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.toneType ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.basicCause ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(value: info.toneType ?? '', isVisible: true.obs),
        ],
      );
    }
  }
}

String _purchase = """{
    "total": "741",
    "data": [
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "ANDIKALIBALI",
            "NextBillingDate": "2024-03-18 08:23:12",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-02-29 20:59:58",
            "BasicCause": "668",
            "ToneType": "Local_Tones",
            "TransactionType": "Deactivated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "Call Out",
            "NextBillingDate": "2024-03-19 08:21:17",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-03-18 08:21:17",
            "BasicCause": "662",
            "ToneType": "Local_Tones",
            "TransactionType": "Activated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "IMITHANDAZO",
            "NextBillingDate": "2024-03-14 18:33:03",
            "CallCharge": "0",
            "Channel": "SMS",
            "SubscriptionDate": "2024-03-13 18:33:03",
            "BasicCause": "662",
            "ToneType": "Local_Tones",
            "TransactionType": "Activated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "ULELE",
            "NextBillingDate": "2024-03-08 09:59:56",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-03-07 09:59:56",
            "BasicCause": "662",
            "ToneType": "Local_Tones",
            "TransactionType": "Activated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "ULALA KANJANI",
            "NextBillingDate": "2024-03-02 13:01:05",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-02-29 21:25:09",
            "BasicCause": "668",
            "ToneType": "Local_Tones",
            "TransactionType": "Deactivated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "LOVE NWANTINTI",
            "NextBillingDate": "2024-03-02 12:59:25",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-02-16 16:07:43",
            "BasicCause": "668",
            "ToneType": "Pulse",
            "TransactionType": "Deactivated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "TSHWALA BAMI",
            "NextBillingDate": "2024-03-03 12:57:41",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-03-02 12:57:41",
            "BasicCause": "662",
            "ToneType": "Local_Tones",
            "TransactionType": "Activated"
        },
        {
            "AParty": "832008988",
            "BParty": "N/A",
            "EnglishToneName": "Please Mr",
            "NextBillingDate": "2024-03-01 06:56:22",
            "CallCharge": "0",
            "Channel": "USSD",
            "SubscriptionDate": "2024-02-14 09:26:10",
            "BasicCause": "668",
            "ToneType": "Local_Tones",
            "TransactionType": "Deactivated"
        }
    ]
}
""";
