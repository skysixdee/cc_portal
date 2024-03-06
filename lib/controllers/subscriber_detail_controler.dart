import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class SubscriberDetailController extends GetxController {
  RxList<List<CustomTableViewModel>> packDetailList =
      <List<CustomTableViewModel>>[].obs;
  RxList<List<CustomTableViewModel>> toneDetailList =
      <List<CustomTableViewModel>>[].obs;
  @override
  void onInit() async {
    createTablePackDetailsHeaderColumnList();
    createTableToneDetailsHeaderColumnList();
    super.onInit();
  }

  getToneDetail(String msisdn) async {
    toneDetailList.clear();
    createTableToneDetailsHeaderColumnList();
    await Future.delayed(Duration(seconds: 3));
    ToneDetailModal model = await getToneDetailApi();
    createToneDetailRowList(model.tonelist ?? [], msisdn);
    print("tone detail list = ${toneDetailList.length}");
  }

  getPackDetail(String phoneNumber) async {
    packDetailList.clear();
    createTablePackDetailsHeaderColumnList();
    SubscribersModal modal = await getPackDetailApi(phoneNumber);
    createPackDetailRowList(modal.offers, phoneNumber);
  }

  createToneDetailRowList(List<Tonelist> list, String msisdn) {
    if (list.isEmpty) return;
    for (var item in list) {
      toneDetailList.add([
        CustomTableViewModel(
            value: MsisdnStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            value: item.status ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            isButton: false),
        CustomTableViewModel(
            value: item.firstActivationDate ?? '',
            isVisible: true.obs,
            isRemoveable: true),
        CustomTableViewModel(
            value: item.contentId ?? '',
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: item.contentName ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            isButton: false),
        CustomTableViewModel(
            value: item.firstActivationDate ?? '',
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: item.contentType ?? '',
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            title: DeactivateStr, isVisible: true.obs, isRemoveable: false),
      ]);
    }
    print("Total items are ${toneDetailList.length}");
  }

  createPackDetailRowList(List<Offer>? offers, String msisdn) {
    print("Offers items Are = ${offers?.length}");
    if (offers != null) {
      if (offers.isEmpty) return;

      for (var item in offers) {
        packDetailList.add([
          CustomTableViewModel(
              value: msisdn, isVisible: true.obs, isRemoveable: true),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: true),
          CustomTableViewModel(
              value: item.offerStatus ?? '',
              isVisible: true.obs,
              isRemoveable: true,
              isButton: false),
          CustomTableViewModel(
              value: item.chargedDate ?? '',
              isVisible: true.obs,
              isRemoveable: true),
          CustomTableViewModel(
              value: item.expiryDate ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: item.chargedAmount ?? '',
              isVisible: true.obs,
              isRemoveable: false,
              isButton: false),
          CustomTableViewModel(
              value: item.chargedDate ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: item.chargedValidity ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: DeactivateStr,
              isVisible: true.obs,
              isRemoveable: false,
              isButton: true),
        ]);
      }
    }
    print("list length = ${packDetailList.length}");
  }

  createTableToneDetailsHeaderColumnList() {
    toneDetailList.add([
      CustomTableViewModel(
          title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: toneStatusStr,
          isVisible: true.obs,
          isRemoveable: true,
          isButton: false),
      CustomTableViewModel(
          title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: toneIdStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: toneNameStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: false),
      CustomTableViewModel(
          title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: channelIdStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: DeactivateStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createTablePackDetailsHeaderColumnList() {
    packDetailList.add([
      CustomTableViewModel(
          title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: OfferCodeStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: SubscriptionStatusStr,
          isVisible: true.obs,
          isRemoveable: true,
          isButton: false),
      CustomTableViewModel(
          title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: CpNameStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: false),
      CustomTableViewModel(
          title: ActivationChannelStr,
          isVisible: true.obs,
          isRemoveable: false),
      CustomTableViewModel(
          title: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: DeactivateStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
    ]);
  }
}
