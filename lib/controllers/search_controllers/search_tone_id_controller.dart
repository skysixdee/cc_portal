import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/search_tone_id_api.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchToneIdController extends GetxController {
  ActivateTuneController activateTuneController = Get.find();
  RxList<ToneInfo> toneList = <ToneInfo>[].obs;
  RxInt totolCount = 0.obs;
  RxString message = ''.obs;
  RxList<List<CustomTableViewModel>> purchaseList =
      <List<CustomTableViewModel>>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    activateTuneController.onSearchTap = (value) {
      print("SearchToneIdController.onSearchTap ==== $value");
      _searchToneId(value);
    };
    super.onInit();
  }

  _searchToneId(String toneId) async {
    totolCount.value = 0;
    toneList.clear();
    purchaseList.clear();

    if (toneId.isEmpty) {
      message.value = searchResultHereStr;
      return;
    }
    isLoading.value = true;

    ArtistsToneModel artistsToneModel = await searchToneIdApi(toneId);
    toneList.value = artistsToneModel.responseMap?.toneList ?? [];
    totolCount.value = artistsToneModel.responseMap?.resultCount ?? 0;
    if (toneList.isNotEmpty) {
      createHeaderColumnList();
      createRowList(toneList);
    } else {
      message.value = noResultFoundStr;
    }

    isLoading.value = false;
  }

  loadMoreData(int index) {
    print("index tapped $index");
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
