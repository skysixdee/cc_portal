import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTuneController extends GetxController {
  RxString value = ''.obs;
  Rx<SearchType> searchType = SearchType.song.obs;
  RxList searchTypeList =
      [SearchType.song, SearchType.singer, SearchType.songCode].obs;
  RxList searchTypeTitlList = [songStr, singerStr, songCodeStr].obs;

  updateSearchType(SearchType searchType) {
    this.searchType.value = searchType;
  }
}
