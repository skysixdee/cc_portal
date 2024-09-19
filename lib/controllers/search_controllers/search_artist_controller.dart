import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/Models/artist_searched_model.dart';
import 'package:sm_admin_portal/Models/artists_tune_model.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/artist_tune_search_api.dart';
import 'package:sm_admin_portal/api_calls/get_artist_search_list_api.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchArtistController extends GetxController {
  RxBool isLoading = false.obs;
  String searchedName = '';
  RxString message = searchResultHereStr.obs;
  RxBool isArtistNameTable = true.obs;
  String artistName = '';
  RxInt totalSongCount = 0.obs;
  RxInt totalArtistCount = 0.obs;
  RxList<ArtistList> _artistList = <ArtistList>[].obs;

  RxList<ToneInfo> artistTuneList = <ToneInfo>[].obs;

  ActivateTuneController activateTuneController = Get.find();

  RxList<List<GenericTableViewModel>> artistNameTableList =
      <List<GenericTableViewModel>>[].obs;
  RxList<List<GenericTableViewModel>> artistsTuneTableList =
      <List<GenericTableViewModel>>[].obs;

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
    totalArtistCount.value = 0;
    totalSongCount.value = 0;
    searchedName = name;
    artistNameTableList.clear();
    artistsTuneTableList.clear();
    if (searchedName.isEmpty) {
      message.value = searchResultHereStr;
      return;
    }
    _artistList.clear();
    isArtistNameTable.value = true;
    isLoading.value = true;
    ArtistSearchModel artistSearchModel = await getArtistSearchListApi(name);
    _artistList.value = artistSearchModel.responseMap?.artistList ?? [];
    totalArtistCount.value = artistSearchModel.responseMap?.resultCount ?? 0;
    if (_artistList.isEmpty) {
      message.value = noResultFoundStr;
    } else {
      createArtistNameRowList(_artistList);
    }
    isLoading.value = false;
  }

  loadMoreArtistList(int index) async {
    isLoading.value = true;
    print("Load more artist list $index");
    ArtistSearchModel artistSearchModel =
        await getArtistSearchListApi(searchedName, pageNo: index);
    _artistList.value = artistSearchModel.responseMap?.artistList ?? [];
    if (_artistList.isEmpty) {
      message.value = noResultFoundStr;
    } else {
      createArtistNameRowList(_artistList);
    }
    isLoading.value = false;
  }

  getArtistTuneList(String artistName) async {
    totalArtistCount.value = 0;
    totalSongCount.value = 0;
    this.artistName = artistName;
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 100));
    ArtistsToneModel artistsToneModel = await artistTuneSearchApi(artistName);
    artistTuneList.value = artistsToneModel.responseMap?.toneList ?? [];
    totalSongCount.value = artistsToneModel.responseMap?.resultCount ?? 0;
    if (artistTuneList.isEmpty) {
      message.value = noResultFoundStr;
    } else {
      createArtistTuneRowList(artistTuneList);
    }

    print("SKY======= ${artistName}");
    isLoading.value = false;
  }

  loadMoreArtistTuneList(int pageNo) async {
    isLoading.value = true;
    ArtistsToneModel artistsToneModel =
        await artistTuneSearchApi(artistName, pageNo: pageNo);
    artistTuneList.value = artistsToneModel.responseMap?.toneList ?? [];
    if (artistTuneList.isEmpty) {
      message.value = noResultFoundStr;
    } else {}

    createArtistTuneRowList(artistTuneList);
    isLoading.value = false;
    print("SKY======= ${artistName}");
  }

  createArtistNameRowList(List<ArtistList> list) {
    artistNameTableList.clear();
    if (list.isEmpty) return;
    for (var info in list) {
      artistNameTableList.add(
        [
          GenericTableViewModel(
              columnTitle: ArtistStr,
              columnValue: '${info.val}',
              object: info,
              isVisible: true.obs),
          GenericTableViewModel(
              columnTitle: ActionStr,
              object: info,
              childType: ChildType.button,
              isVisible: true.obs),
        ],
      );
    }
  }

  createArtistTuneRowList(List<ToneInfo> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      artistsTuneTableList.add(
        [
          GenericTableViewModel(
              columnValue: info.toneName ?? '', isVisible: true.obs),
          GenericTableViewModel(
              columnValue: info.toneId ?? '', isVisible: true.obs),
          GenericTableViewModel(
              columnValue: info.artistName ?? '', isVisible: true.obs),
          GenericTableViewModel(
              columnValue: info.price ?? '', isVisible: true.obs),
          GenericTableViewModel(
            columnValue: 'channel ',
            isVisible: true.obs,
          ),
        ],
      );
    }
  }
}
