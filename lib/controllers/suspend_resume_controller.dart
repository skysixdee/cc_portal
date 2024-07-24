import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/suspend_and_resume_model.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/suspend_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

import '../reusable_view/custom_table_view/custom_table_view_model.dart';

class SuspendResumeController extends GetxController {
  RxList<List<CustomTableViewModel>> suspendDetailList =
      <List<CustomTableViewModel>>[].obs;
  List<Offer>? tonelist = [];

  //RxBool isLoadingPackDetail = false.obs;
  //RxBool isLoadingToneDetail = false.obs;

  RxBool isLoadingSuspendResumedetail = false.obs;
  String searchedText = '';
  String msisdn = '';
  @override
  void onInit() async {
    createTableSuspendResumeDetailsHeaderColumnList();
    //getToneDetailApi();
    //createPackDetailRowList(modal.offers, phoneNumber);
    super.onInit();
  }

  onSearchTapAction() {
    getPackDetail(msisdn);
  }

  // getPackDetail(String phoneNumber) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   suspendDetailList.clear();
  //   SubscribersModal modal = await getPackDetailApi(phoneNumber);
  //   //ToneDetailModal model = await getToneDetailApi();
  //   isLoadingToneDetail.value = false;
  //   if (modal.respCode == 0) {
  //     suspendDetailList.clear();
  //     tonelist = modal.tonelist ?? [];
  //     createTableSuspendResumeDetailsHeaderColumnList();
  //     createSuspendResumeDetailRowList(tonelist, msisdn);
  //   }

  //   // print("tone detail list = ${toneDetailList.length}");
  // }

  getPackDetail(String phoneNumber) async {
    suspendDetailList.clear();

    //isLoadingPackDetail.value = true;
    isLoadingSuspendResumedetail.value = true;
    createTableSuspendResumeDetailsHeaderColumnList();
    SubscribersModal modal = await getPackDetailApi(phoneNumber);
    //isLoadingPackDetail.value = false;
    isLoadingSuspendResumedetail.value = false;
    tonelist = modal.offers ?? [];
    createSuspendResumeDetailRowList(modal.offers, phoneNumber);
  }

  // getPackDetail(String phoneNumber) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   suspendDetailList.clear();
  //   SubscribersModal modal = await getPackDetailApi(phoneNumber);
  //   //ToneDetailModal model = await getToneDetailApi();
  //   isLoadingToneDetail.value = false;
  //   if (modal.respCode == 0) {
  //     suspendDetailList.clear();
  //     tonelist = modal.tonelist ?? [];
  //     createTableSuspendResumeDetailsHeaderColumnList();
  //     createSuspendResumeDetailRowList(tonelist, msisdn);
  //   }

  //   // print("tone detail list = ${toneDetailList.length}");
  // }

  suspendService(int index) async {
    GenericModal genericModal = await suspendApi(msisdn);
    if (genericModal.respCode == 0) {
      print(" suspended");

      tonelist?[index].isSuspended?.value = true;

      changeStatus();
    } else {
      print("failed");
    }
  }

  resumeService(int index) async {
    GenericModal genericModal = await suspendApi(msisdn);
    if (genericModal.respCode == 0) {
      print(" suspended");

      tonelist?[index].isSuspended?.value = false;

      changeStatus();
    } else {
      print("failed");
    }
  }

  changeStatus() {
    suspendDetailList.clear();
    createTableSuspendResumeDetailsHeaderColumnList();
    createSuspendResumeDetailRowList(tonelist, msisdn);
  }

  createTableSuspendResumeDetailsHeaderColumnList() {
    suspendDetailList.add([
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
          title: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: LanguageStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
      CustomTableViewModel(
          title: suspendedStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
      CustomTableViewModel(
          title: ActionStr,
          value: DeactivateStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
    ]);
  }

  createSuspendResumeDetailRowList(List<Offer>? list, String msisdn) {
    print("Offers items Are = ${list?.length}");
    if (list != null) {
      if (list.isEmpty) return;
      print("suspendDetailList = ${suspendDetailList.length}");
      for (var item in list) {
        suspendDetailList.add([
          CustomTableViewModel(
              value: msisdn, isVisible: true.obs, isRemoveable: true),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: true),
          CustomTableViewModel(
              value: item.expiryDate ?? '',
              isVisible: true.obs,
              isRemoveable: true,
              isButton: false),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: true),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: false,
              isButton: false),
          CustomTableViewModel(
              value: item.offerName ?? '',
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: (item.isSuspended?.value ?? true) ? "YES" : "NO",
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(
              value: "",
              isVisible: true.obs,
              isRemoveable: false,
              isButton: true),
        ]);
      }
    }
    print("list length = ${suspendDetailList.length}");
  }
}
