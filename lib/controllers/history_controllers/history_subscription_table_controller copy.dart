import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistorySubscriptionTableController extends GetxController {
  RxList<List<CustomTableViewModel>> subscriptionList =
      <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() {
    createHeaderColumnList();

    createRowList();
    super.onInit();
  }

  createHeaderColumnList() {
    subscriptionList.add([
      CustomTableViewModel(title: aPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: bPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: englishToneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: NextBillingDateStr, isVisible: true.obs),
      CustomTableViewModel(
          title: callChargeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: channelStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: timeStampStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: toneTypeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: transactionTypeStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList() {
    for (var i = 0; i < 10; i++) {
      subscriptionList.add(
        [
          CustomTableViewModel(value: aPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: bPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: englishToneNameStr, isVisible: true.obs),
          CustomTableViewModel(value: NextBillingDateStr, isVisible: true.obs),
          CustomTableViewModel(value: callChargeStr, isVisible: true.obs),
          CustomTableViewModel(value: channelStr, isVisible: true.obs),
          CustomTableViewModel(value: timeStampStr, isVisible: true.obs),
          CustomTableViewModel(value: toneTypeStr, isVisible: true.obs),
          CustomTableViewModel(value: transactionTypeStr, isVisible: true.obs),
        ],
      );
    }
  }
}
