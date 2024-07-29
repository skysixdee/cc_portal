import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/Models/search_tone_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/search_text_api.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchToneController extends GetxController {
  ActivateTuneController activateTuneController = Get.find();
  RxList<List<CustomTableViewModel>> purchaseList =
      <List<CustomTableViewModel>>[].obs;

  RxBool isLoading = false.obs;
  RxList<ToneInfo> _toneList = <ToneInfo>[].obs;
  RxString message = ''.obs;
  RxInt totolCount = 0.obs;
  String searchedText = '';
  @override
  void onInit() {
    super.onInit();
    purchaseList.clear();
    activateTuneController.onSearchTap = (value) {
      print("activateTuneController.onSearchTap ==== $value");
      _searchTone(value);
    };
  }

  Future<void> _searchTone(String text, {int pageNo = 0}) async {
    searchedText = text;
    if (searchedText.isEmpty) {
      return;
    }
    purchaseList.clear();
    isLoading.value = true;
    SearchToneModel searchToneModel =
        await searchToneApi(text, "148", pageNo: pageNo);
    _toneList.value = searchToneModel.responseMap?.toneList ?? [];
    totolCount.value = searchToneModel.responseMap?.resultCount ?? 0;
    message.value = _toneList.isEmpty ? noResultFoundStr : '';
    isLoading.value = false;
    if (_toneList.isNotEmpty) {
      createHeaderColumnList();
      createRowList(_toneList);
    }

    return;
  }

  loadMoreData(int index) async {
    _toneList.clear();
    isLoading.value = true;
    SearchToneModel searchToneModel =
        await searchToneApi(searchedText, "148", pageNo: index);
    _toneList.value = searchToneModel.responseMap?.toneList ?? [];
    message.value = _toneList.isEmpty ? noResultFoundStr : '';
    isLoading.value = false;
    if (_toneList.isNotEmpty) {
      createHeaderColumnList();
      createRowList(_toneList);
    }
  }

  createHeaderColumnList() {
    purchaseList.clear();
    purchaseList.add([
      CustomTableViewModel(title: toneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: toneIdStr, isVisible: true.obs),
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: priceStr, isVisible: true.obs),
      CustomTableViewModel(title: ActionStr, isVisible: true.obs),
    ]);
  }

  createRowList(List<ToneInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      purchaseList.add(
        [
          CustomTableViewModel(value: '${info.toneName}', isVisible: true.obs),
          CustomTableViewModel(value: '${info.toneId}', isVisible: true.obs),
          CustomTableViewModel(
              value: '${info.artistName}', isVisible: true.obs),
          CustomTableViewModel(value: '${info.price}', isVisible: true.obs),
          CustomTableViewModel(
              value: 'channel ', isVisible: true.obs, isButton: true),
        ],
      );
    }
  }
}
