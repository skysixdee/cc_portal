import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/artist_searched_model.dart';
import 'package:sm_admin_portal/api_calls/get_artist_search_list_api.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchArtistController extends GetxController {
  RxBool isLoading = false.obs;
  String searchedName = '';
  RxString message = ''.obs;
  RxBool isArtistNameTable = true.obs;
  RxList<ArtistList> _artistList = <ArtistList>[].obs;
  ActivateTuneController activateTuneController = Get.find();

  RxList<List<CustomTableViewModel>> artistNameTableList =
      <List<CustomTableViewModel>>[].obs;
  RxList<List<CustomTableViewModel>> artistsTuneTableList =
      <List<CustomTableViewModel>>[].obs;

  @override
  void onInit() {
    activateTuneController.onSearchTap = (value) {
      print("SearchArtistController.onSearchTap ==== $value");
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
      createHeaderColumnList();
      createRowList(_artistList);
    }
    isLoading.value = false;
  }

  getArtistTuneList() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    isLoading.value = false;
  }

  createHeaderColumnList() {
    artistNameTableList.clear();
    artistNameTableList.add([
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: ActionStr, isVisible: true.obs),
    ]);
  }

  createRowList(List<ArtistList> list) {
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
}
