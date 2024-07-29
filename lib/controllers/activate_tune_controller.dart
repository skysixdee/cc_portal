import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/Models/Generic_modal.dart';
import 'package:sm_admin_portal/Models/offer_list_model.dart';
import 'package:sm_admin_portal/Models/search_tone_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/api_calls/list_offer_api.dart';
import 'package:sm_admin_portal/api_calls/search_text_api.dart';
import 'package:sm_admin_portal/api_calls/set_tone_api.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTuneController extends GetxController {
  RxString value = ''.obs;
  RxBool isConfirming = false.obs;
  RxBool isLoading = false.obs;
  String searchedText = '';
  RxString errorMessage = ''.obs;
  String selectedFrequency = '';
  String selectedServiceTypeValue = '';
  String selectedServiceTypeTitle = '';

  RxList<ToneInfo> _toneList = <ToneInfo>[].obs;
  RxString message = ''.obs;
  Rx<SearchType> searchType = SearchType.song.obs;
  RxList searchTypeList =
      [SearchType.song, SearchType.singer, SearchType.songCode].obs;
  RxList searchTypeTitlList = [songStr, singerStr, songCodeStr].obs;

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
