import 'package:cc_portal/api_calls/transaction_api.dart';
import 'package:cc_portal/models/generic_table_view_model.dart';
import 'package:cc_portal/models/history_model.dart';
import 'package:cc_portal/models/tone_info.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<List<GenericTableViewModel>> historyList =
      <List<GenericTableViewModel>>[].obs;
  @override
  void onInit() {
    super.onInit();
    transactionHistory();
  }

  transactionHistory() async {
    isLoading.value = true;
    HistoryModel model = await getTransactionApi("2024-12-01", "2024-12-20");
    //model.data
    print("items are ==== ${model.data?.length}");
    createRowList(model.data ?? []);
    //crete
    isLoading.value = false;
  }

  createRowList(List<HistoryInfo> data) {
    historyList.clear();
    if (data.isEmpty) return;
    for (var info in data) {
      historyList.add(
        [
          GenericTableViewModel(
            columnTitle: englishToneNameStr,
            columnValue: '${info.englishToneName}',
            isVisible: true.obs,
            object: info,
          ),
          // GenericTableViewModel(
          //   columnTitle: aPartyStr,
          //   columnValue: '${info.aParty}',
          //   isVisible: true.obs,
          //   object: info,
          // ),
          GenericTableViewModel(
            columnTitle: NextBillingDateStr,
            columnValue: '${info.nextBillingDate}',
            isVisible: false.obs,
            isRemovable: true,
            childType: ChildType.text,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: channelStr,
            columnValue: '${info.channel}',
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: deactivationDateStr,
            columnValue: '${info.deactivationDate}',
            isVisible: false.obs,
            isRemovable: true,
            childType: ChildType.text,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: statusStr,
            columnValue: '${info.transactionType}',
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: chargeStr,
            columnValue: '${info.callCharge}',
            isVisible: true.obs,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: OfferCodeStr,
            columnValue: '${info.offerName}',
            isVisible: false.obs,
            isRemovable: true,
            object: info,
          ),
          GenericTableViewModel(
            columnTitle: validityStr,
            columnValue: '${info.validityDays}',
            isVisible: true.obs,
            object: info,
          ),
        ],
      );
    }
    print("length is ====== ${historyList.length}");
  }
}
