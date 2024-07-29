// /*import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:sm_admin_portal/Models/subscribers_modal.dart';
// import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
// import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
// import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
// import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
// import 'package:sm_admin_portal/network_manager/network_manager.dart';
// import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
// import 'package:sm_admin_portal/utilily/strings.dart';
// import 'package:sm_admin_portal/utilily/urls.dart';

// class SubscriberDetailController extends GetxController {
//   RxList<List<CustomTableViewModel>> packDetailList =
//       <List<CustomTableViewModel>>[].obs;
//   RxList<List<CustomTableViewModel>> toneDetailList =
//       <List<CustomTableViewModel>>[].obs;
//   @override
//   void onInit() async {
//     createTablePackDetailsHeaderColumnList();
//     createTableToneDetailsHeaderColumnList();
//     super.onInit();
//   }

//   getToneDetail(String msisdn) async {
//     toneDetailList.clear();
//     createTableToneDetailsHeaderColumnList();
//     await Future.delayed(Duration(seconds: 3));
//     ToneDetailModal model = await getToneDetailApi();
//     createToneDetailRowList(model.tonelist ?? [], msisdn);
//     print("tone detail list = ${toneDetailList.length}");
//   }

//   getPackDetail(String phoneNumber) async {
//     packDetailList.clear();

//     createTablePackDetailsHeaderColumnList();
//     SubscribersModal modal = await getPackDetailApi(phoneNumber);
//     createPackDetailRowList(modal.offers, phoneNumber);
//   }

//   // getDeletePack(String offerName) async {
//   //   deletePackApi.call(offerName);

//   //   SubscribersModal modal = await getPackDetailApi(offerName);
//   //   createPackDetailRowList(modal.offers, offerName);
//   // }*/

// import 'package:get/get.dart';

// import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
// import 'package:sm_admin_portal/Models/tone_list_model.dart';

// import 'package:sm_admin_portal/api_calls/tune_list_api.dart';

// import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
// import 'package:sm_admin_portal/utilily/strings.dart';

// class TuneListController extends GetxController {
//   // RxList<List<CustomTableViewModel>> packDetailList =
//   //  <List<CustomTableViewModel>>[].obs;
//   RxList<List<CustomTableViewModel>> toneList =
//       <List<CustomTableViewModel>>[].obs;
//   RxBool isLoadingPackDetail = false.obs;
//   RxBool isLoadingSettingsList = false.obs;
//   String searchedText = '';
//   @override
//   void onInit() async {
//     // createTablePackDetailsHeaderColumnList();
//     // createTableToneDetailsHeaderColumnList();
//     createTableToneListsHeaderColumnList();
//     super.onInit();
//   }

//   getToneList(String msisdn) async {
//     toneList.clear();
//     isLoadingSettingsList.value = true;
//     createTableToneListsHeaderColumnList();
//     await Future.delayed(Duration(seconds: 3));
//     ToneListModel model = await toneListApi();

//     print("SKY 1======${model.tonelist?.length} ");
//     isLoadingSettingsList.value = false;
//     createToneDetailRowList(model.tonelist ?? [], msisdn);
//     print("SKY 2====== ");
//     print("tone detail list = ${toneList.length}");
//   }

//   createTableToneListsHeaderColumnList() {
//     toneList.add([
//       CustomTableViewModel(
//           title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
//       CustomTableViewModel(
//           title: ToneStatusStr,
//           isVisible: true.obs,
//           isRemoveable: true,
//           isButton: false),
//       CustomTableViewModel(
//           title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
//       CustomTableViewModel(
//           title: toneIdStr, isVisible: true.obs, isRemoveable: true),
//       CustomTableViewModel(
//           title: ToneNameStr,
//           isVisible: true.obs,
//           isRemoveable: false,
//           isButton: false),
//       CustomTableViewModel(
//           title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
//       CustomTableViewModel(
//           title: channelIdStr, isVisible: true.obs, isRemoveable: false),
//       CustomTableViewModel(
//           title: DeactivateStr, isVisible: true.obs, isRemoveable: false),
//     ]);
//   }

//   createToneDetailRowList(List<Tonelist> list, String msisdn) {
//     print("1 list ========= ${list.length}");
//     if (list.isEmpty) return;
//     print("2 list ========= ${list.length}");
//     for (var item in list) {
//       toneList.add([
//         CustomTableViewModel(
//             value: MsisdnStr,
//             isVisible: true.obs,
//             isRemoveable: true,
//             object: item),
//         CustomTableViewModel(
//             //  value: item.status ?? '',

//             isVisible: true.obs,
//             isRemoveable: true,
//             isButton: false,
//             object: item),
//         CustomTableViewModel(
//             // value: item.firstActivationDate ?? '',
//             isVisible: true.obs,
//             isRemoveable: true,
//             object: item),
//         CustomTableViewModel(
//             value: item.toneId ?? '',
//             isVisible: true.obs,
//             isRemoveable: false,
//             object: item),
//         CustomTableViewModel(
//             //  value: item.contentName ?? '',
//             isVisible: true.obs,
//             isRemoveable: false,
//             isButton: false,
//             object: item),
//         CustomTableViewModel(
//             //    value: item.firstActivationDate ?? '',
//             isVisible: true.obs,
//             isRemoveable: false,
//             object: item),
//         CustomTableViewModel(
//             //    value: item.contentType ?? '',
//             isVisible: true.obs,
//             isRemoveable: false,
//             object: item),
//         CustomTableViewModel(
//             title: DeactivateStr,
//             isVisible: true.obs,
//             isRemoveable: false,
//             isButton: true,
//             object: item),
//       ]);
//     }
//     // print("Total items are ${to.length}");
//   }
// }

import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/Models/tone_list_model.dart';


import 'package:sm_admin_portal/api_calls/tune_list_api.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';

import 'package:sm_admin_portal/utilily/strings.dart';

class TuneListController extends GetxController {
  RxList<List<CustomTableViewModel>> toneList =
      <List<CustomTableViewModel>>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingSettingsList = false.obs;
  String searchedText = '';

  @override
  void onInit() {
    super.onInit();
    createTableToneListsHeaderColumnList();
  }                      

  Future<void> getToneList(String phoneNumber) async {
   
    toneList.clear();
    isLoading.value = true;
    createTableToneListsHeaderColumnList();
    await Future.delayed(Duration(seconds: 2));
    ToneListModel model = await toneListApi();
    isLoading.value = false;
    createToneDetailRowList(model.tonelist ?? [], phoneNumber);
  }

  void createTableToneListsHeaderColumnList() {
    toneList.add([
      CustomTableViewModel(
        title: toneIdStr, isVisible: true.obs, isRemoveable: true),

         // title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
        title: ToneNameStr, isVisible: true.obs, isRemoveable: false, isButton: false),

        //  title: ToneStatusStr,isVisible: true.obs,isRemoveable: true,isButton: false),
      CustomTableViewModel(
        title: ToneStatusStr,isVisible: true.obs,isRemoveable: true,isButton: false),

         // title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
        title: ActivationDateStr, isVisible: true.obs, isRemoveable: true),

         // title: toneIdStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
        title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),

         // title: ToneNameStr, isVisible: true.obs, isRemoveable: false, isButton: false),
      // CustomTableViewModel(
      //     title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: channelIdStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: actionStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  void createToneDetailRowList(List<Tonelist> list, String phoneNumber) {
    if (list.isEmpty) return;

    for (var item in list) {
      toneList.add([
        CustomTableViewModel(
            // value: MsisdnStr,
            // isVisible: true.obs,
            // isRemoveable: true,
            // object: item),
            value: item.contentId ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            // value: item.status ?? '',
            // isVisible: true.obs,
            // isRemoveable: true,
            // isButton: false,
            // object: item),
             value: item.contentName ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            isButton: false,
            object: item),
        CustomTableViewModel(
            // value: item.firstActivationDate ?? '',
            // isVisible: true.obs,
            // isRemoveable: true,
            // object: item),

            value: item.status ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            isButton: false,
            object: item),
        CustomTableViewModel(
          value: item.firstActivationDate ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            object: item),

           // value: item.contentId ?? '',
            // isVisible: true.obs,
            // isRemoveable: false,
            // object: item),
        CustomTableViewModel(
            // value: item.contentName ?? '',
            // isVisible: true.obs,
            // isRemoveable: false,
            // isButton: false,
            // object: item),
             //  value: item.expiryDate ?? '', // Next billing date-----value
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        // CustomTableViewModel(
        //     //  value: item.expiryDate ?? '', // Next billing date-----value
        //     isVisible: true.obs,
        //     isRemoveable: false,
        //     object: item),
        CustomTableViewModel(
          value:
           item.firstActivationDate ?? "",
           // value: item.contentType ?? '', // Channel ID-----value
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            title: actionStr,
            isVisible: true.obs,
            isRemoveable: false,
            isButton: true,
            object: item),
      ]);
    }
  }
}
