import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sm_admin_portal/Models/copy_tone_modal.dart';
import 'package:sm_admin_portal/Models/get_subscription_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/copy_tone_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class CopyTonecontroller extends GetxController {
  RxList<List<CustomTableViewModel>> copyDetailList =
      <List<CustomTableViewModel>>[].obs;
  List<Offer>? tonelist = [];
  RxBool isLoadingCopyTonedetail = false.obs;
  String searchedText = '';
  String msisdn = '';

  void onInit() async {
    createTableCopyToneDetailsHeaderColumnList();
    //getToneDetailApi();
    //createPackDetailRowList(modal.offers, phoneNumber);
    super.onInit();
  }

  onSearchTapAction() {
    getCopyToneDetail(msisdn);
  }

  createTableCopyToneDetailsHeaderColumnList() {
    copyDetailList.add([
      CustomTableViewModel(
        title: MsisdnStr,
        isVisible: true.obs,
        isRemoveable: true,
      ),
      CustomTableViewModel(
          title: SubscriptionCodeStr,
          isVisible: true.obs,
          isRemoveable: true,
          isButton: false),
      CustomTableViewModel(
          title: OfferCodeStr, isVisible: true.obs, isRemoveable: true),
      CustomTableViewModel(
          title: ToneStatusStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: CpNameStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: false),
      CustomTableViewModel(
          title: ActivationTypeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: ToneNameStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
      CustomTableViewModel(
          title: LanguageStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
      CustomTableViewModel(
          title: ChannelStr,
          value: DeactivateStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true),
      CustomTableViewModel(
          title: SelectStr,
          value: DeactivateStr,
          isVisible: true.obs,
          isRemoveable: false,
          isButton: true)
    ]);
  }

  getCopyToneDetail(String msisdn) async {
    copyDetailList.clear();
    isLoadingCopyTonedetail.value = true;
    createTableCopyToneDetailsHeaderColumnList();
    await Future.delayed(Duration(seconds: 2));
    CopyToneDetailModal model = await getCopyToneDetailApi();
    isLoadingCopyTonedetail.value = false;
    createToneDetailRowList(model.copytonelist ?? [], msisdn);
  }

  createToneDetailRowList(List<CTonelist> list, String msisdn) {
    if (list.isEmpty) return;
    for (var item in list) {
      copyDetailList.add([
        CustomTableViewModel(
            value: item.msisdn ?? '',
            isVisible: true.obs,
            isRemoveable: true,
            object: item),
        CustomTableViewModel(
            value: item.subscriptionCode ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.offerCode ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.toneStatus ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            isButton: false,
            object: item),
        CustomTableViewModel(
            value: item.cpName ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.activationType ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.toneName ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.language ?? '',
            isVisible: true.obs,
            isRemoveable: false,
            object: item),
        CustomTableViewModel(
            value: item.channelId ?? '',
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
  }
}
