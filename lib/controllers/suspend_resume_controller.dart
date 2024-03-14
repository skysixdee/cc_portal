import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/Models/suspend_and_resume_model.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/suspend_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

import '../reusable_view/custom_table_view/custom_table_view_model.dart';

class SuspendResumeController extends GetxController{
   RxList<List<CustomTableViewModel>> suspendDetailList =
      <List<CustomTableViewModel>>[].obs;
RxBool isLoadingPackDetail = false.obs;
RxBool isLoadingToneDetail = false.obs;
String searchedText='';
String msisdn = '';
  @override
  void onInit() async {
    createTableSuspendResumeDetailsHeaderColumnList();
    //getToneDetailApi();
    //createPackDetailRowList(modal.offers, phoneNumber);
    super.onInit();
  }
onSearchTapAction(){
  getToneDetail(msisdn);
}
  getToneDetail(String msisdn) async {
    
  
   //createTableSuspendResumeDetailsHeaderColumnList();
    await Future.delayed(Duration(seconds: 3));
    SubscribersModal modal = await getPackDetailApi(msisdn);
    

    isLoadingToneDetail.value = false;
    
    createSuspendResumeDetailRowList(modal.offers ?? [], msisdn);
   // print("tone detail list = ${toneDetailList.length}");
  }

  suspendService() async{
    GenericModal genericModal = await suspendApi(msisdn);
    if(genericModal.respCode == 0){
      print(" suspended");

    }else{
      print("failed");
    }
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

  createSuspendResumeDetailRowList(List<Offer>? offers, String msisdn) {
    print("Offers items Are = ${offers?.length}");
    if (offers != null) {
      if (offers.isEmpty) return;

      for (var item in offers) {
        suspendDetailList.add([
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
              value: item.chargedDate ??"",
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