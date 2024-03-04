/*
import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SubscriberDetailController extends GetxController {
  RxList<List<CustomTableViewModel>> list = <List<CustomTableViewModel>>[].obs;
  
  @override
  void onInit() async {
    createRowList();
    super.onInit();
  }

  List<List<CustomTableViewModel>> createRowList() {
    List<List<CustomTableViewModel>> newLst = [
      [
        CustomTableViewModel(
            title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            title: OfferCodeStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            title: SubscriptionStatusStr,
            isVisible: true.obs,
            isRemoveable: true,
            isButton: true),
        CustomTableViewModel(
            title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            title: NextBillingDateStr,
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            title: CpNameStr,
            isVisible: true.obs,
            isRemoveable: false,
            isButton: true),
        CustomTableViewModel(
            title: ActivationChannelStr,
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            title: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
        CustomTableViewModel(
            title: DeactivateStr, isVisible: true.obs, isRemoveable: false),
      ],
    ];
    newLst.add(
      [
        CustomTableViewModel(
            value: MsisdnStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            value: OfferCodeStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            value: SubscriptionStatusStr,
            isVisible: true.obs,
            isRemoveable: true,
            isButton: true),
        CustomTableViewModel(
            value: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            value: NextBillingDateStr,
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: CpNameStr,
            isVisible: true.obs,
            isRemoveable: false,
            isButton: true),
        CustomTableViewModel(
            value: ActivationChannelStr,
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
        CustomTableViewModel(
            value: DeactivateStr, isVisible: true.obs, isRemoveable: false),
      ],
    );
    // newLst.add(
    //   [
    //     CustomTableViewModel(
    //         value: MsisdnStr, isVisible: true.obs, isRemoveable: true),
    //     CustomTableViewModel(
    //         value: OfferCodeStr, isVisible: true.obs, isRemoveable: true),
    //     CustomTableViewModel(
    //         value: SubscriptionStatusStr,
    //         isVisible: true.obs,
    //         isRemoveable: true,
    //         isButton: true),
    //     CustomTableViewModel(
    //         value: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
    //     CustomTableViewModel(
    //         value: NextBillingDateStr,
    //         isVisible: true.obs,
    //         isRemoveable: false),
    //     CustomTableViewModel(
    //         value: CpNameStr,
    //         isVisible: true.obs,
    //         isRemoveable: false,
    //         isButton: true),
    //     CustomTableViewModel(
    //         value: ActivationChannelStr,
    //         isVisible: true.obs,
    //         isRemoveable: false),
    //     CustomTableViewModel(
    //         value: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
    //     CustomTableViewModel(
    //         value: DeactivateStr, isVisible: true.obs, isRemoveable: false),
    //   ],
    // );

    list.value = newLst;
    return list;
  }
}

*/