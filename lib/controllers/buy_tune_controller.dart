import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/Models/generic_modal.dart';

import 'package:sm_admin_portal/Models/offer_list_model.dart';
import 'package:sm_admin_portal/api_calls/list_offer_api.dart';
import 'package:sm_admin_portal/api_calls/set_tone_api.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class BuyTuneController extends GetxController {
  RxString errorMessage = ''.obs;
  RxBool isConfirming = false.obs;
  RxBool loadingOffer = false.obs;
  int _selectedFrequencyIndex = 0;
  RxString selectedServiceTitle = ''.obs;
  RxString selectedFrequencyTitle = ''.obs;
  RxList<OfferList> offerList = <OfferList>[].obs;
  String selectedOfferId = '';
  RxList<String> serviceTypeMenuList = <String>[].obs;
  List<String> frequencyMenuList = [dailyStr, weeklyStr, monthlyStr];
  Function()? onBuySuccess;
  getListOffer({int index = 0}) async {
    _selectedFrequencyIndex = index;
    offerList.clear();
    serviceTypeMenuList.clear();
    selectedFrequencyTitle.value = '';
    selectedServiceTitle.value = '';

    loadingOffer.value = true;

    OfferListModel offerListModel = await listOfferApi(index);
    errorMessage.value = '';
    print("Offer list ========= ${offerListModel.offerList?.length}");

    for (OfferList itm in offerListModel.offerList ?? []) {
      offerList.add(itm);
      serviceTypeMenuList.add(itm.offerMarketingName ?? '');
    }
    errorMessage.value = offerList.isEmpty ? someThingWentWrongStr : "";
    selectedServiceTitle.value = offerList.isEmpty ? someThingWentWrongStr : "";
    ;
    loadingOffer.value = false;
  }

  updateFrequency(int index) {
    errorMessage.value = '';
    getListOffer(index: index);
    selectedFrequencyTitle.value = frequencyMenuList[index];
  }

  updateServiceType(int index) {
    // if (offerList.isEmpty) {
    //   getListOffer(index: _selectedFrequencyIndex);
    //   return;
    // }
    selectedServiceTitle.value = offerList[index].offerMarketingName ?? '';
    selectedOfferId = offerList[index].offerName ?? '';
    errorMessage.value = '';
  }

  confirmButtonAction(String toneId) async {
    if (selectedFrequencyTitle.isEmpty) {
      errorMessage.value = selectFrequencyErrorStr;
      return;
    }
    if (selectedServiceTitle.isEmpty) {
      print("Selecte some thing");
      errorMessage.value = selectServiceTypeErrorStr;
      return;
    }
    errorMessage.value = '';
    print(
        "===============\n ${selectedFrequencyTitle} \n service type == ${selectedServiceTitle} \n========================");
    isConfirming.value = true;

    GenericModal genericModal = await setToneApi(selectedOfferId, toneId);

    if (genericModal.respCode == 0) {
      if (onBuySuccess != null) {
        print("SKY Buy Success 3");
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
