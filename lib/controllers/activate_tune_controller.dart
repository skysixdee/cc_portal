import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:cc_portal/Models/tone_info.dart';
import 'package:cc_portal/enums/search_type.dart';

class ActivateTuneController extends GetxController {
  RxString value = ''.obs;
  RxBool isConfirming = false.obs;
  RxBool isLoading = false.obs;
  String searchedText = '';
  RxBool isEnglish = true.obs;
  RxString errorMessage = ''.obs;
  String selectedFrequency = '';
  String selectedServiceTypeValue = '';
  String selectedServiceTypeTitle = '';

  RxList<ToneInfo> _toneList = <ToneInfo>[].obs;
  RxString message = ''.obs;
  Rx<SearchType> searchType = SearchType.song.obs;
  RxList searchTypeList =
      [SearchType.song, SearchType.singer, SearchType.songCode].obs;
  RxList searchTypeTitlList = [ToneNameStr, ArtistStr, toneIdStr].obs;

  RxList<String> serviceTypeMenuList = <String>[].obs;
  RxList<String> serviceTypeValueList = <String>[].obs;
  Function()? onBuySuccess;
  Function(String)? onSearchTap;
  @override
  void onInit() {
    super.onInit();
  }

  searchText() async {
    _toneList.clear();

    print("Search type is ${searchType}");
  }

  updateFrequency(String value) {
    errorMessage.value = '';
    selectedFrequency = value;
    selectedServiceTypeValue = "";
    selectedServiceTypeTitle = '';
  }

  updateSelectedServiceType(String value, String title) {
    errorMessage.value = '';

    selectedServiceTypeValue = value;
    selectedServiceTypeTitle = title;
  }

  onChangeText(String text) {
    searchedText = text;
    message.value = '';
    print("$text");
  }

  //_searchApiCall() {}

  updateSearchType(SearchType searchType) async {
    this.searchType.value = searchType;
    if (onSearchTap != null) {
      await Future.delayed(Duration(milliseconds: 80));
      onSearchTap!(searchedText);
    }

    _toneList.clear();
    // createHeaderColumnList();
  }
}
