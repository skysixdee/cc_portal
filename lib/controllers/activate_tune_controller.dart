import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/Models/search_tone_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/search_text_api.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTuneController extends GetxController {
  RxString value = ''.obs;
  RxBool isConfirming = false.obs;
  RxBool isLoading = false.obs;
  String searchedText = '';
  RxList<ToneInfo> _toneList = <ToneInfo>[].obs;

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
  }

  searchText() async {
    purchaseList.clear();
    createHeaderColumnList();
    print("Search type is ${searchType}");
    SearchToneModel searchToneModel = await searchToneApi(searchedText, "148");
    _toneList.value = searchToneModel.responseMap?.toneList ?? [];
    print("Sky======== ${_toneList.length}");
    createRowList(_toneList);
  }

  onChangeText(String text) {
    searchedText = text;
    print("$text");
  }

  //_searchApiCall() {}

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
      CustomTableViewModel(title: toneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: toneIdStr, isVisible: true.obs),
      CustomTableViewModel(title: priceStr, isVisible: true.obs),
      CustomTableViewModel(title: statusStr, isVisible: true.obs),
    ]);
  }

  createRowList(List<ToneInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      purchaseList.add(
        [
          CustomTableViewModel(value: '${info.toneName}', isVisible: true.obs),
          CustomTableViewModel(
              value: '${info.artistName}', isVisible: true.obs),
          CustomTableViewModel(value: '${info.toneId}', isVisible: true.obs),
          CustomTableViewModel(value: '${info.price}', isVisible: true.obs),
          CustomTableViewModel(
              value: 'channel ', isVisible: true.obs, isButton: true),
        ],
      );
      print("purchaseList ======== ${purchaseList.length}");
    }
  }
}
