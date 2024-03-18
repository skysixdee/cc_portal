import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistoryRenewalTableController extends GetxController {
  RxList<List<CustomTableViewModel>> renewalList =
      <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() {
    createHeaderColumnList();

    createRowList();
    super.onInit();
  }

  createHeaderColumnList() {
    renewalList.add([
      CustomTableViewModel(title: msisdnCStr, isVisible: true.obs),
      CustomTableViewModel(title: OfferCodeStr, isVisible: true.obs),
      CustomTableViewModel(title: ActivationDateStr, isVisible: true.obs),
      CustomTableViewModel(title: lastChargeDeductionStr, isVisible: true.obs),
      CustomTableViewModel(
          title: NextBillingDateStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: ActivationChannelStr,
          isVisible: true.obs,
          isRemoveable: false),
      CustomTableViewModel(
          title: toneIdStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: toneNameStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: amountDeductedStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: transactionTypeStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList() {
    for (var i = 0; i < 10; i++) {
      renewalList.add(
        [
          CustomTableViewModel(value: aPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: bPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: englishToneNameStr, isVisible: true.obs),
          CustomTableViewModel(value: NextBillingDateStr, isVisible: true.obs),
          CustomTableViewModel(value: callChargeStr, isVisible: true.obs),
          CustomTableViewModel(value: channelStr, isVisible: true.obs),
          CustomTableViewModel(value: timeStampStr, isVisible: true.obs),
          CustomTableViewModel(value: toneTypeStr, isVisible: true.obs),
          CustomTableViewModel(
              title: amountDeductedStr,
              isVisible: true.obs,
              isRemoveable: false),
          CustomTableViewModel(value: transactionTypeStr, isVisible: true.obs),
        ],
      );
    }
  }
}
