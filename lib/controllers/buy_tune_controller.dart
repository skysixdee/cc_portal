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
  RxInt selectedIndex = 0.obs;
  RxList<OfferList> offerList = <OfferList>[].obs;
  //RxList<String> offerNameList = <String>[].obs;
  String selectedOfferId = '';
  Function()? onBuySuccess;

  @override
  void onInit() {
    super.onInit();
    getListOffer();
  }

  getListOffer() async {
    offerList.clear();
    OfferListModel offerListModel = await listOfferApi();
    errorMessage.value = '';
    offerList.value = offerListModel.offerList ?? [];
    // for (OfferList itm in offerListModel.offerList ?? []) {
    //   offerList.add(itm);
    //   //offerNameList.add(itm.offerMarketingName ?? '');

    // }
    if (offerList.isNotEmpty) {
      selectedOfferId = offerList[0].offerName ?? '';
    }
    errorMessage.value = offerList.isEmpty ? someThingWentWrongStr : "";
  }

  confirmButtonAction(String toneId) async {
    errorMessage.value = '';

    if (selectedOfferId.isEmpty) {
      errorMessage.value = selectPacknameStr;
      return;
    }
    isConfirming.value = true;
    GenericModal genericModal = await setToneApi(selectedOfferId, toneId);

    if (genericModal.respCode == 0) {
      if (onBuySuccess != null) {
        print("SKY Buy Success 3");
        onBuySuccess!();
        await Future.delayed(Duration(milliseconds: 200));
        openGenericPopup(genericModal.message ?? 'No Message');
      }
    } else {
      errorMessage.value = genericModal.message ?? someThingWentWrongStr;
    }
    isConfirming.value = false;
  }

  updatedSelectedPackName(int index) {
    errorMessage.value = '';
    selectedIndex.value = index;
    selectedOfferId = offerList[index].offerName ?? '';
  }
}
