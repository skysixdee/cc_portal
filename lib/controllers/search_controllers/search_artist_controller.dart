import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/artist_searched_model.dart';
import 'package:sm_admin_portal/api_calls/get_artist_search_list_api.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchArtistController extends GetxController {
  RxBool isLoading = false.obs;
  String searchedName = '';
  RxString message = ''.obs;
  RxList<List<CustomTableViewModel>> artistTableList =
      <List<CustomTableViewModel>>[].obs;
  RxList<ArtistList> _artistList = <ArtistList>[].obs;
  getArtistList(String name) async {
    searchedName = name;
    if (searchedName.isEmpty) {
      return;
    }
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

  createHeaderColumnList() {
    artistTableList.add([
      CustomTableViewModel(title: ArtistStr, isVisible: true.obs),
      CustomTableViewModel(title: viewStr, isVisible: true.obs),
    ]);
  }

  createRowList(List<ArtistList> list) {
    if (list.isEmpty) return;
    for (var info in list) {
      artistTableList.add(
        [
          CustomTableViewModel(value: '${info.val}', isVisible: true.obs),
          CustomTableViewModel(
              value: 'channel ', isVisible: true.obs, isButton: true),
        ],
      );
    }
  }
}
