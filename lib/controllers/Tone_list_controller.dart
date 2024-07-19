/*import 'dart:convert';

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
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

  // getDeletePack(String offerName) async {
  //   deletePackApi.call(offerName);

    
  //   SubscribersModal modal = await getPackDetailApi(offerName);
  //   createPackDetailRowList(modal.offers, offerName);
  // }*/

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/Models/list_settin_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tune_list_api.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class TuneListController extends GetxController {
  // RxList<List<CustomTableViewModel>> packDetailList =
  //  <List<CustomTableViewModel>>[].obs;
  RxList<List<CustomTableViewModel>> toneList =
      <List<CustomTableViewModel>>[].obs;
  RxBool isLoadingPackDetail = false.obs;
  RxBool isLoadingSettingsList = false.obs;
  String searchedText = '';
  @override
  void onInit() async {
    // createTablePackDetailsHeaderColumnList();
    // createTableToneDetailsHeaderColumnList();
    createTableToneListsHeaderColumnList();
    super.onInit();
  }

  //  getToneList(String msisdn) async {
  //   toneDetailList.clear();
  //   isLoadingToneDetail.value = true;
  //   createTableToneDetailsHeaderColumnList();
  //   await Future.delayed(Duration(seconds: 3));
  //   ToneDetailModal model = await getToneDetailApi();
  //   isLoadingToneDetail.value = false;
  //   createToneDetailRowList(model.tonelist ?? [], msisdn);
  //   print("tone detail list = ${toneDetailList.length}");
  // }

  getToneList(String msisdn) async {
    toneList.clear();
    isLoadingSettingsList.value = true;
    createTableToneListsHeaderColumnList();
    await Future.delayed(Duration(seconds: 3));
    ListToneSettingModel model = await toneListApi();
    isLoadingSettingsList.value = false;
    createToneDetailRowList(model.settingslist ?? [], msisdn);
    print("tone detail list = ${toneList.length}");
  }

  // delete pack
  // deletePack(String offerName, int rowNo) async {
  //   GenericModal model = await deletePackApi(offerName);
  //   if (model.respCode == 0) {
  //     packDetailList.removeAt(rowNo);
  //   }
  // }

  createTableToneListsHeaderColumnList() {
    toneList.add([
      CustomTableViewModel(
          title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: ToneStatusStr,
          isVisible: true.obs,
          isRemoveable: true,
          isButton: false),
      CustomTableViewModel(
          title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: toneIdStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: ToneNameStr,
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

  createToneDetailRowList(List<Settingslist> list, String msisdn) {
    if (list.isEmpty) return;
    print('msisdn=$msisdn');
    for (var item in list) {
      toneList.add([
        CustomTableViewModel(
            value: MsisdnStr,
            isVisible: true.obs,
            isRemoveable: true,
            object: item),
        CustomTableViewModel(
            //  value: item.status ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            isButton: false,
            object: item),
        CustomTableViewModel(
            // value: item.firstActivationDate ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            object: item),
        CustomTableViewModel(
            value: item.contentId ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            //  value: item.contentName ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            isButton: false,
            object: item),
        CustomTableViewModel(
            //    value: item.firstActivationDate ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            //    value: item.contentType ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            title: DeactivateStr,
            isVisible: true.obs,
            isRemoveable: false,
            isButton: true,
            object: item),
      ]);
    }
    // print("Total items are ${to.length}");
  }
}
