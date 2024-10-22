import 'package:get/get.dart';

import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/Models/search_tone_model.dart';
import 'package:cc_portal/Models/tone_info.dart';
import 'package:cc_portal/api_calls/search_text_api.dart';
import 'package:cc_portal/controllers/activate_tune_controller.dart';

import 'package:cc_portal/utilily/strings.dart';

class SearchToneController extends GetxController {
  ActivateTuneController activateTuneController = Get.find();
  RxList<List<GenericTableViewModel>> purchaseList =
      <List<GenericTableViewModel>>[].obs;

  RxBool isLoading = false.obs;
  RxList<ToneInfo> _toneList = <ToneInfo>[].obs;
  RxString message = searchResultHereStr.obs;
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
    purchaseList.clear();
    totolCount.value = 0;
    if (searchedText.isEmpty) {
      message.value = searchResultHereStr;
      return;
    }

    isLoading.value = true;
    SearchToneModel searchToneModel =
        await searchToneApi(text, "148", pageNo: pageNo);
    _toneList.value = searchToneModel.responseMap?.toneList ?? [];
    totolCount.value = searchToneModel.responseMap?.resultCount ?? 0;
    message.value = _toneList.isEmpty ? noResultFoundStr : '';
    isLoading.value = false;
    if (_toneList.isNotEmpty) {
      createRowList(_toneList);
    } else {
      message.value = noResultFoundStr;
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
      //    createHeaderColumnList();
      createRowList(_toneList);
    }
  }

  createRowList(List<ToneInfo> list) {
    purchaseList.clear();
    if (list.isEmpty) return;
    for (var info in list) {
      purchaseList.add(
        [
          GenericTableViewModel(
            columnTitle: toneNameStr,
            columnValue: '${info.toneName}',
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: toneIdStr,
            columnValue: '${info.toneId}',
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: ArtistStr,
            columnValue: '${info.artistName}',
            isRemovable: true,
            isVisible: false.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: priceStr,
            columnValue: '${info.price}',
            isRemovable: true,
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
              columnTitle: playStr,
              columnValue: 'channel ',
              isVisible: true.obs,
              isRemovable: true,
              object: info,
              childType: ChildType.play),
          GenericTableViewModel(
              columnTitle: actionStr,
              columnValue: 'channel ',
              isVisible: true.obs,
              isRemovable: true,
              object: info,
              childType: ChildType.button),
        ],
      );
    }
  }
}
