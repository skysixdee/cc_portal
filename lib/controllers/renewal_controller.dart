import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class RenewalController extends GetxController {
  RxList<List<CustomTableViewModel>> suspendDetailList =
      <List<CustomTableViewModel>>[].obs;
  List<Tonelist> list = [];
  @override
  void onInit() {
    createTableSuspendResumeDetailsHeaderColumnList();
    super.onInit();
  }

  getToneDetail() async {
    suspendDetailList.clear();
    ToneDetailModal model = await getToneDetailApi();
    print("Model ===== ${model}");
    createSuspendResumeDetailRowList(model.tonelist ?? []);
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
          title: statusStr,
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

  onChangeStatus() {
    suspendDetailList.clear();
    createSuspendResumeDetailRowList(list);
  }

  createSuspendResumeDetailRowList(List<Tonelist> list) {
    this.list = list;
    //List<String> offers = ["", "", "", "", ""];
    // for (var i = 0; i < offers.length; i++) {
    //   // }
    for (var item in list) {
      suspendDetailList.add([
        CustomTableViewModel(
            value: "8123812512", isVisible: true.obs, isRemoveable: true),
        CustomTableViewModel(
            value: item.albumName ?? '',
            isVisible: true.obs,
            isRemoveable: true),
        CustomTableViewModel(
            value: item.artistName ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            isButton: false),
        CustomTableViewModel(
            value: item.contentId ?? '',
            isVisible: true.obs,
            isRemoveable: true),
        CustomTableViewModel(
            value: item.contentType ?? '',
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: item.price ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            isButton: false),
        CustomTableViewModel(
            value: item.albumName ?? '',
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
            value: item.isSuspend!.value ? 'YES' : "NO",
            isVisible: true.obs,
            isRemoveable: false),
        CustomTableViewModel(
          value: "",
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true,
        ),
      ]);
    }
  }
  //print("list length = ${suspendDetailList.length}");
}
