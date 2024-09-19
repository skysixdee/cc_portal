import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
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
  String _toneId = '';
  RxList<List<GenericTableViewModel>> tuneList =
      <List<GenericTableViewModel>>[].obs;
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
    _toneId = toneId;
    totolCount.value = 0;
    toneList.clear();
    tuneList.clear();

    if (toneId.isEmpty) {
      message.value = searchResultHereStr;
      return;
    }
    isLoading.value = true;

    ArtistsToneModel artistsToneModel = await searchToneIdApi(toneId);
    toneList.value = artistsToneModel.responseMap?.toneList ?? [];
    totolCount.value = artistsToneModel.responseMap?.resultCount ?? 0;
    if (toneList.isNotEmpty) {
      createRowList(toneList);
    } else {
      message.value = noResultFoundStr;
    }

    isLoading.value = false;
  }

  loadMoreData(int index) async {
    print("index tapped $index");
    isLoading.value = true;

    ArtistsToneModel artistsToneModel =
        await searchToneIdApi(_toneId, pageNo: index);
    toneList.value = artistsToneModel.responseMap?.toneList ?? [];
    totolCount.value = artistsToneModel.responseMap?.resultCount ?? 0;
    if (toneList.isNotEmpty) {
      createRowList(toneList);
    } else {
      message.value = noResultFoundStr;
    }

    isLoading.value = false;
  }

  createRowList(List<ToneInfo> list) {
    tuneList.clear();
    if (list.isEmpty) return;
    for (var info in list) {
      tuneList.add(
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
