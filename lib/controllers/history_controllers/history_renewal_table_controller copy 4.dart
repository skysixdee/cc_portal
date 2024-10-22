import 'dart:convert';

import 'package:get/get.dart';
import 'package:cc_portal/Models/history_renewal_model.dart';
import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:cc_portal/enums/visiblity_type.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:cc_portal/utilily/strings.dart';

class HistoryRenewalTableController extends GetxController {
  RxList<List<CustomTableViewModel>> renewalList =
      <List<CustomTableViewModel>>[].obs;
  HistoryController con = Get.find();
  @override
  void onInit() {
    createHeaderColumnList();

    super.onInit();
  }

  makeApiCall() async {
    if (renewalList.length > 1) {
      print("Empyt==============");
      return;
    }
    await Future.delayed(Duration(milliseconds: 20));
    con.visibilityType.value = VisibilityType.loading;
    String url = '';
    Map<String, dynamic> jsonData = {};
    // Map<String, dynamic> respData = await NetworkManager().postResquest(url, jsonData);
    await Future.delayed(Duration(seconds: 2));
    Map<String, dynamic> respData = json.decode(_renewal);
    HistoryRenewalModel model = HistoryRenewalModel.fromJson(respData);
    if (model.data != null) {
      renewalList.clear();
      createHeaderColumnList();
      createRowList(model.data ?? []);
      con.visibilityType.value = VisibilityType.loaded;
    }
  }

  createHeaderColumnList() {
    renewalList.add([
      CustomTableViewModel(title: msisdnCStr, isVisible: true.obs),
      CustomTableViewModel(title: OfferCodeStr, isVisible: true.obs),
      CustomTableViewModel(title: ActivationDateStr, isVisible: true.obs),
      CustomTableViewModel(title: lastChargeDeductionStr, isVisible: true.obs),
      CustomTableViewModel(
          title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: ActivationChannelStr,
          isVisible: true.obs,
          isRemoveable: false),
      CustomTableViewModel(
          title: toneIdStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: toneNameStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: amountDeductedStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: transactionTypeStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList(List<RenewalInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      // }
      // for (var i = 0; i < 10; i++) {
      renewalList.add(
        [
          CustomTableViewModel(value: info.aParty ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.offerCode ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.subscriptionDate ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.lastChargedDeductionDate ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.nextBillingDate ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: info.subscriptionDate ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: info.toneId ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: info.englishToneName ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: info.callCharge ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: info.transactionType ?? '',
              isVisible: true.obs,
              isRemoveable: false),
        ],
      );
    }
  }
}

String _renewal = """{
    "total": "757",
    "data": [
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-02-29 20:59:58",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-18 08:23:12",
            "Channel": "USSD",
            "ToneId": "99116244",
            "EnglishToneName": "ANDIKALIBALI",
            "CallCharge": "0",
            "TransactionType": "Deactivated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-18 08:21:17",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-19 08:21:17",
            "Channel": "USSD",
            "ToneId": "601991000000005076",
            "EnglishToneName": "Call Out",
            "CallCharge": "0",
            "TransactionType": "Activated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-13 18:33:03",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-14 18:33:03",
            "Channel": "SMS",
            "ToneId": "99136979",
            "EnglishToneName": "IMITHANDAZO",
            "CallCharge": "0",
            "TransactionType": "Activated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-07 09:59:56",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-08 09:59:56",
            "Channel": "USSD",
            "ToneId": "99118980",
            "EnglishToneName": "ULELE",
            "CallCharge": "0",
            "TransactionType": "Activated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-02-29 21:25:09",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-02 13:01:05",
            "Channel": "USSD",
            "ToneId": "99725245",
            "EnglishToneName": "ULALA KANJANI",
            "CallCharge": "0",
            "TransactionType": "Deactivated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-02-16 16:07:43",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-02 12:59:25",
            "Channel": "USSD",
            "ToneId": "99120988",
            "EnglishToneName": "LOVE NWANTINTI",
            "CallCharge": "0",
            "TransactionType": "Deactivated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-03-02 12:57:41",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-03 12:57:41",
            "Channel": "USSD",
            "ToneId": "99119347",
            "EnglishToneName": "TSHWALA BAMI",
            "CallCharge": "0",
            "TransactionType": "Activated"
        },
        {
            "DeactivationDate": "N/A",
            "SubscriptionDate": "2024-02-14 09:26:10",
            "AParty": "832008988",
            "OfferCode": "CRBT",
            "LastChargedDeductionDate": "N/A",
            "NextBillingDate": "2024-03-01 06:56:22",
            "Channel": "USSD",
            "ToneId": "601906000000022845",
            "EnglishToneName": "Please Mr",
            "CallCharge": "0",
            "TransactionType": "Deactivated"
        }
    ]
}
""";
