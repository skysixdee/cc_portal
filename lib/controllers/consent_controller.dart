import 'package:cc_portal/models/consent_modal.dart';
import 'package:cc_portal/models/generic_table_view_model.dart';
import 'package:cc_portal/api_calls/pack_consent_api.dart';
import 'package:cc_portal/api_calls/templet_message_api.dart';
import 'package:cc_portal/api_calls/tone_consent_api.dart';
import 'package:cc_portal/models/templet_message_model.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConsentController extends GetxController {
  var isLoading = false.obs;
  var isLoadingTempletMessage = false.obs;
  String templetMessage = '';
  var consentResponse = Rx<ConsentModal?>(null);

  List<List<GenericTableViewModel>> tuneConsentTableList = [];
  List<List<GenericTableViewModel>> packConsentTableList = [];

  String formatTimestamp(String timestamp) {
    try {
      DateTime date = DateTime.parse(timestamp);
      return DateFormat('dd-MM-yyyy, HH:mm').format(date);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  Future<void> _createPackConsentData(
      List<List<GenericTableViewModel>> packConsentTableList,
      ConsentModal consentResponse,
      {bool isEmpty = false}) async {
    packConsentTableList.clear();

    if (isEmpty) {
    } else {
      if (consentResponse.consentStatus == null ||
          consentResponse.consentStatus!.isEmpty) {
        return;
      }
    }

    // if (consentResponse.consentStatus == null ||
    //     consentResponse.consentStatus!.isEmpty) {
    //   return;
    // }
//format

    packConsentTableList.add([
      GenericTableViewModel(
        columnTitle: templateIdStr,
        // columnValue: consentResponse.templateId,
        columnValue: consentResponse.templateId ?? 'N/A',
        isVisible: true.obs,
        childType: isEmpty ? ChildType.none : ChildType.clickableText,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: statusStr,
        //  columnValue: consentResponse.consentStatus,
        columnValue: consentResponse.consentStatus ?? 'N/A',
        isVisible: true.obs,
        childType: isEmpty ? ChildType.none : ChildType.status,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: sendTimeStr,
        //columnValue: consentResponse.sentTimestamp,
        columnValue: formatTimestamp(consentResponse.sentTimestamp ?? 'N/A'),
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedTimeStr,
        //  columnValue: consentResponse.rcvTimestamp,
        columnValue: formatTimestamp(consentResponse.rcvTimestamp ?? 'N/A'),
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedDataStr,
        //   columnValue: consentResponse.message,
        columnValue: consentResponse.message ?? 'N/A',
        isVisible: true.obs,
        object: consentResponse,
      ),
    ]);
    return;
  }

  Future<void> _createTuneConsentData(
      List<List<GenericTableViewModel>> tuneConsentTableList,
      ConsentModal consentResponse,
      {bool isEmpty = false}) async {
    tuneConsentTableList.clear();
    if (isEmpty) {
    } else {
      if (consentResponse.consentStatus == null ||
          consentResponse.consentStatus!.isEmpty) {
        return;
      }
    }

    tuneConsentTableList.add([
      GenericTableViewModel(
        columnTitle: templateIdStr,
        //   columnValue: consentResponse.templateId,
        columnValue: consentResponse.templateId ?? 'N/A',
        isVisible: true.obs,
        childType: isEmpty ? ChildType.none : ChildType.clickableText,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: statusStr,
        // columnValue: consentResponse.consentStatus,
        columnValue: consentResponse.consentStatus ?? 'N/A',
        isVisible: true.obs,
        childType: isEmpty ? ChildType.none : ChildType.status,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: sendTimeStr,
        // columnValue: consentResponse.sentTimestamp,
        columnValue: formatTimestamp(
            consentResponse.sentTimestamp ?? 'N/A'), // Format sentTimestamp
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedTimeStr,
        // columnValue: consentResponse.rcvTimestamp,
        columnValue: formatTimestamp(consentResponse.rcvTimestamp ?? 'N/A'),
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedDataStr,
        // columnValue: consentResponse.message,
        columnValue: consentResponse.message ?? 'N/A',
        isVisible: true.obs,
        object: consentResponse,
      ),
    ]);
    return;
  }

  Future<void> fetchPackconsent(String phoneNumber, String offerCode) async {
    isLoading.value = true;

    try {
      ConsentModal response = await packConsentApi(phoneNumber, offerCode);
      consentResponse.value = response;
      await _createPackConsentData(packConsentTableList,
          response.respCode != 0 ? ConsentModal() : response,
          isEmpty: response.respCode != 0);
    } catch (e) {
      await _createPackConsentData(
        packConsentTableList,
        ConsentModal(),
        isEmpty: true,
      );
      print('Error fetching PackconsentApi: $e');
    } finally {
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  fetchTempletMessage(String templetId) async {
    isLoadingTempletMessage.value = true;

    TempletMessageModel model = await templetMessageApi(templetId);
    try {
      String message = model.templateList?.first.data ?? '';
      templetMessage =
          (message.replaceAll("<<MSISDN>>", StoreManager().customerNumber));
    } catch (e) {
      templetMessage = someThingWentWrongStr;
      print("Hello sky check this $templetMessage");
    }
    isLoadingTempletMessage.value = false;
    return;
  }

  Future<void> fetchToneconsent(String phoneNumber, String contentId) async {
    isLoading.value = true;
    try {
      ConsentModal response = await toneConsentApi(phoneNumber, contentId);
      consentResponse.value = response;
      await _createTuneConsentData(tuneConsentTableList,
          response.respCode != 0 ? ConsentModal() : response,
          isEmpty: response.respCode != 0);
    } catch (e) {
      await _createTuneConsentData(tuneConsentTableList, ConsentModal(),
          isEmpty: true);
      print('Error fetching ToneconsentApi: $e');
    } finally {
      isLoading.value = false;
    }
    isLoading.value = false;
  }
}
