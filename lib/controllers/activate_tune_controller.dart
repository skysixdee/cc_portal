import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTuneController extends GetxController {
  RxString value = ''.obs;
  RxBool isConfirming = false.obs;
  RxBool isLoading = false.obs;
  Rx<SearchType> searchType = SearchType.song.obs;
  RxList searchTypeList =
      [SearchType.song, SearchType.singer, SearchType.songCode].obs;
  RxList searchTypeTitlList = [songStr, singerStr, songCodeStr].obs;

  RxList<List<CustomTableViewModel>> purchaseList =
      <List<CustomTableViewModel>>[].obs;
  List<String> frequencyList = [dailyStr, weeklyStr, monthlyStr];
  List<String> serviceTypeMenuList = [
    "Promotion Pack",
    "Promotion Tone",
    "Promotion Pack And Tone"
  ];
  @override
  void onInit() {
    super.onInit();
    createHeaderColumnList();
    createRowList();
  }

  updateSearchType(SearchType searchType) {
    this.searchType.value = searchType;
  }

  confirmButtonAction() async {
    isConfirming.value = true;
    await Future.delayed(Duration(seconds: 2));
    isConfirming.value = false;
  }

  createHeaderColumnList() {
    purchaseList.add([
      CustomTableViewModel(title: aPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: bPartyStr, isVisible: true.obs),
      CustomTableViewModel(title: englishToneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: NextBillingDateStr, isVisible: true.obs),
      CustomTableViewModel(
          title: callChargeStr, isVisible: true.obs, isRemoveable: false),
      CustomTableViewModel(
          title: "Activate", isVisible: true.obs, isRemoveable: false),
    ]);
  }

  createRowList() {
    //if (list.isEmpty) return;
    for (int i = 0; i < 10; i++) {
      //(var info in 0.. 10) {
      purchaseList.add(
        [
          CustomTableViewModel(value: '$i aParty', isVisible: true.obs),
          CustomTableViewModel(value: '$i  bParty', isVisible: true.obs),
          CustomTableViewModel(
              value: '$i  englishToneName ', isVisible: true.obs),
          CustomTableViewModel(
            value: '$i  nextBillingDate',
            isVisible: true.obs,
          ),
          CustomTableViewModel(value: '$i  callCharge  ', isVisible: true.obs),
          CustomTableViewModel(
              value: '$i  channel ', isVisible: true.obs, isButton: true),
        ],
      );
    }
  }
}
