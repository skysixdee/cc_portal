import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/Models/artist_searched_model.dart';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/artist_tune_search_api.dart';
import 'package:sm_admin_portal/api_calls/get_artist_search_list_api.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchArtistController extends GetxController {
  RxBool isLoading = false.obs;
  String searchedName = '';
  RxString message = ''.obs;
  RxBool isArtistNameTable = true.obs;
  String artistName = '';
  RxList<ArtistList> _artistList = <ArtistList>[].obs;

  RxList<ToneInfo> artistTuneList = <ToneInfo>[].obs;

  ActivateTuneController activateTuneController = Get.find();

  RxList<List<CustomTableViewModel>> artistNameTableList =
      <List<CustomTableViewModel>>[].obs;
  RxList<List<CustomTableViewModel>> artistsTuneTableList =
      <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() {
    activateTuneController.onSearchTap = (value) {
      print("SearchArtistController.onSearchTap ==== $value");
      this.artistName = '';
      _artistList.clear();
      artistTuneList.clear();
      _getArtistList(value);
    };
    super.onInit();
  }

  _getArtistList(String name) async {
    searchedName = name;
    if (searchedName.isEmpty) {
      return;
    }
    _artistList.clear();
    isArtistNameTable.value = true;
    isLoading.value = true;
    ArtistSearchModel artistSearchModel = await getArtistSearchListApi(name);
    _artistList.value = artistSearchModel.responseMap?.artistList ?? [];
    if (_artistList.isEmpty) {
      message.value = noResultFoundStr;
    } else {
      createArtistNameHeaderColumnList();
      createArtistNameRowList(_artistList);
    }
    isLoading.value = false;
  }

  getArtistTuneList(String artistName) async {
    this.artistName = artistName;
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    ArtistsToneModel artistsToneModel = await artistTuneSearchApi(artistName);
    artistTuneList.value = artistsToneModel.responseMap?.toneList ?? [];
    createArtistTuneHeaderColumnList();
    createArtistTuneRowList(artistTuneList);
    print("SKY======= ${artistName}");
    isLoading.value = false;
  }

  createArtistNameHeaderColumnList() {
    artistNameTableList.clear();
    artistNameTableList.add([
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: ActionStr, isVisible: true.obs),
    ]);
  }

  createArtistNameRowList(List<ArtistList> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      artistNameTableList.add(
        [
          CustomTableViewModel(value: '${info.val}', isVisible: true.obs),
          CustomTableViewModel(
              value: 'channel ', isVisible: true.obs, isButton: true),
        ],
      );
    }
  }

  createArtistTuneHeaderColumnList() {
    artistsTuneTableList.clear();
    artistsTuneTableList.add([
      CustomTableViewModel(title: toneNameStr, isVisible: true.obs),
      CustomTableViewModel(title: toneIdStr, isVisible: true.obs),
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: priceStr, isVisible: true.obs),
      CustomTableViewModel(title: ActionStr, isVisible: true.obs),
    ]);
  }

  createArtistTuneRowList(List<ToneInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      artistsTuneTableList.add(
        [
          CustomTableViewModel(value: info.toneName ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.toneId ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: info.artistName ?? '', isVisible: true.obs),
          CustomTableViewModel(value: info.price ?? '', isVisible: true.obs),
          CustomTableViewModel(
              value: 'channel ', isVisible: true.obs, isButton: true),
        ],
      );
    }
  }
}
