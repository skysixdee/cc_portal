import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

import 'package:sm_admin_portal/enums/search_type.dart';

class ActivateTuneController extends GetxController {
  RxBool isConfirming = false.obs;
  RxBool isLoading = false.obs;
  String searchedText = '';

  Rx<SearchType> searchType = SearchType.song.obs;
  RxList searchTypeList =
      [SearchType.song, SearchType.singer, SearchType.songCode].obs;
  RxList searchTypeTitlList = [songStr, singerStr, songCodeStr].obs;

  Function(String)? onSearchTap;
  @override
  void onInit() {
    super.onInit();
  }

  onChangeText(String text) {
    searchedText = text;

    print("$text");
  }

  updateSearchType(SearchType searchType) async {
    this.searchType.value = searchType;
    if (onSearchTap != null) {
      await Future.delayed(Duration(milliseconds: 80));
      onSearchTap!(searchedText);
    }
  }
}
