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

  List<String> frequencyList = [dailyStr, weeklyStr, monthlyStr];
  RxList<String> serviceTypeMenuList = <String>[].obs;
  RxList<String> serviceTypeValueList = <String>[].obs;
  Function()? onBuySuccess;
  @override
  void onInit() {
    super.onInit();

    getListOffer();
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

  getListOffer({int index = 0}) async {
    serviceTypeMenuList.clear();
    serviceTypeValueList.clear();
    OfferListModel offerListModel = await listOfferApi(index);
    print("Offer list ========= ${offerListModel.offerList?.length}");

    for (OfferList itm in offerListModel.offerList ?? []) {
      serviceTypeMenuList.add(itm.offerMarketingName ?? '');
      serviceTypeValueList.add(itm.offerName ?? '');
    }
  }

  onChangeText(String text) {
    searchedText = text;

    message.value = '';
    print("$text");
  }

  //_searchApiCall() {}

  updateSearchType(SearchType searchType) {
    this.searchType.value = searchType;

    _toneList.clear();
    // createHeaderColumnList();
  }

  confirmButtonAction(String toneId) async {
    if (selectedFrequency.isEmpty) {
      errorMessage.value = selectFrequencyErrorStr;
      return;
    }
    if (selectedServiceTypeValue.isEmpty) {
      print("Selecte some thing");
      errorMessage.value = selectServiceTypeErrorStr;
      return;
    }
    errorMessage.value = '';
    print(
        "===============\n ${selectedFrequency} \n service type == ${selectedServiceTypeValue} \n========================");
    isConfirming.value = true;

    GenericModal genericModal =
        await setToneApi(selectedServiceTypeValue, toneId);
    if (genericModal.respCode == 0) {
      if (onBuySuccess != null) {
        onBuySuccess!();
        await Future.delayed(Duration(milliseconds: 200));
        openGenericPopup(genericModal.message ?? 'No Message');
        // Get.dialog(Center(
        //   child:
        //       GenericPopupView(message: genericModal.message ?? 'No Message'),
        // ));
      }
    } else {
      errorMessage.value = genericModal.message ?? someThingWentWrongStr;
    }
    isConfirming.value = false;
  }
}
