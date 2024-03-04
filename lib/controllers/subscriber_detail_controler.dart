import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class SubscriberDetailController extends GetxController {
  RxList<List<CustomTableViewModel>> list = <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() async {
    createTableHeaderColumnList();
    super.onInit();
  }

  getDetail(String phoneNumber) async {
    String url =
        'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
    //  jsonData: );;
    Map<String, dynamic> jsonData = {"msisdn": phoneNumber};
    Map<String, dynamic> jsonMap =
        await NetworkManager().postResquest(url, jsonData);
    SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
    print("modal =${modal.message}");
    print("modal Offers=${modal.offers?.length}");
    print("modal  respCode =${modal.respCode}");
    createRowList(modal.offers, phoneNumber);
  }

  createRowList(List<Offer>? offers, String msisdn) {
    print("Offers items Are = ${offers?.length}");
    if (offers != null) {
      if (offers.isEmpty) return;

      for (var item in offers) {
        list.add([
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
    print("list length = ${list.length}");
  }

  createTableHeaderColumnList() {
    list.add([
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
          title: DeactivateStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }
}
