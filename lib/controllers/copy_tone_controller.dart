import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class CopyTonecontroller extends GetxController{
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
    getPackDetail(msisdn);
  }


    createTableCopyToneDetailsHeaderColumnList() {
    copyDetailList.add([
      CustomTableViewModel(
          title: MsisdnStr, isVisible: true.obs, isRemoveable: true),
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
          title: ActivationTypeStr, isVisible: true.obs, isRemoveable: false
        ),
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

  getPackDetail(String phoneNumber) async {
    copyDetailList.clear();
    isLoadingCopyTonedetail.value=true;
    createTableCopyToneDetailsHeaderColumnList();
    SubscribersModal modal = await getPackDetailApi(phoneNumber);
    //isLoadingPackDetail.value = false;
    isLoadingCopyTonedetail.value=false;
    tonelist = modal.offers ?? [];
    createSuspendResumeDetailRowList(modal.offers, phoneNumber);
  }

  // getPackDetail(String phoneNumber) async {
  //   suspendDetailList.clear();
  
  //   //isLoadingPackDetail.value = true;
  //   isLoadingSuspendResumedetail.value=true;
  //   createTableSuspendResumeDetailsHeaderColumnList();
  //   SubscribersModal modal = await getPackDetailApi(phoneNumber);
  //   //isLoadingPackDetail.value = false;
  //   isLoadingSuspendResumedetail.value=false;
  //   tonelist = modal.offers ?? [];
  //   createSuspendResumeDetailRowList(modal.offers, phoneNumber);
  // }

  createSuspendResumeDetailRowList(List<Offer>? list, String msisdn) {
    print("Offers items Are = ${list?.length}");
    if (list != null) {
      if (list.isEmpty) return;
print("suspendDetailList = ${copyDetailList.length}");
      for (var item in list) {
        copyDetailList.add([
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
          CustomTableViewModel(
              value: "",
              isVisible: true.obs,
              isRemoveable: false,
              isButton: true),
        ]);
      }
    }
    print("list length = ${copyDetailList.length}");
  }
}