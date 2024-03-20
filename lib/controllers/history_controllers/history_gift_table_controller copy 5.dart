import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class HistoryGiftTableController extends GetxController {
  RxList<List<CustomTableViewModel>> giftList =
      <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() {
    createHeaderColumnList();

    createRowList();
    super.onInit();
  }

  createHeaderColumnList() {
    giftList.add([
      CustomTableViewModel(title: timeStampStr, isVisible: true.obs),
      CustomTableViewModel(title: msisdnCStr, isVisible: true.obs),
      CustomTableViewModel(title: toneIdStr, isVisible: true.obs),
      CustomTableViewModel(title: toneNameStr, isVisible: true.obs),
      CustomTableViewModel(
          title: callChargeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: basicCauseStr, isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList() {
    for (var i = 0; i < 10; i++) {
      giftList.add(
        [
          CustomTableViewModel(value: aPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: bPartyStr, isVisible: true.obs),
          CustomTableViewModel(value: englishToneNameStr, isVisible: true.obs),
          CustomTableViewModel(value: NextBillingDateStr, isVisible: true.obs),
          CustomTableViewModel(value: callChargeStr, isVisible: true.obs),
          CustomTableViewModel(value: channelStr, isVisible: true.obs),
        ],
      );
    }
  }
}
