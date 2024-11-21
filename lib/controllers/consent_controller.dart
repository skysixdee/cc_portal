import 'package:cc_portal/Models/consent_modal.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/api_calls/pack_consent_api.dart';
import 'package:cc_portal/api_calls/tone_consent_api.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:get/get.dart';

class ConsentController extends GetxController {
  var isLoading = false.obs;
  var consentResponse = Rx<ConsentModal?>(null);

  List<List<GenericTableViewModel>> tuneConsentTableList = [];
  List<List<GenericTableViewModel>> packConsentTableList = [];

  Future<void> _createPackConsentData(
      List<List<GenericTableViewModel>> packConsentTableList,
      ConsentModal consentResponse) async {
    packConsentTableList.clear();

    if (consentResponse.consentStatus == null ||
        consentResponse.consentStatus!.isEmpty) {
      return;
    }
//format
    packConsentTableList.add([
      GenericTableViewModel(
        columnTitle: templateIdStr,
        // columnValue: consentResponse.templateId,
        columnValue: consentResponse.templateId ?? 'N/A',

        isVisible: true.obs,
        childType: ChildType.clickableText,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: statusStr,
        //  columnValue: consentResponse.consentStatus,
        columnValue: consentResponse.consentStatus ?? 'N/A',
        isVisible: true.obs,
        childType: ChildType.status,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: sendTimeStr,
        //columnValue: consentResponse.sentTimestamp,
        columnValue: consentResponse.sentTimestamp ?? 'N/A',
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedTimeStr,
        //  columnValue: consentResponse.rcvTimestamp,
        columnValue: consentResponse.rcvTimestamp ?? 'N/A',
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
    packConsentTableList.clear();
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
        childType: ChildType.clickableText,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: statusStr,
        // columnValue: consentResponse.consentStatus,
        columnValue: consentResponse.consentStatus ?? 'N/A',
        isVisible: true.obs,
        childType: ChildType.status,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: sendTimeStr,
        // columnValue: consentResponse.sentTimestamp,
        columnValue: consentResponse.sentTimestamp ?? 'N/A',
        isVisible: true.obs,
        object: consentResponse,
      ),
      GenericTableViewModel(
        columnTitle: receivedTimeStr,
        // columnValue: consentResponse.rcvTimestamp,
        columnValue: consentResponse.rcvTimestamp ?? 'N/A',
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

  Future<void> fetchPackconsent(String phoneNumber,
      {String? offerCode, String? contentId}) async {
    try {
      isLoading.value = true;
      ConsentModal response = await PackconsentApi(phoneNumber,
          offerCode: offerCode, contentId: contentId);
      consentResponse.value = response;
      await _createPackConsentData(packConsentTableList, response);
    } catch (e) {
      print('Error fetching consent: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchToneconsent(String phoneNumber,
      {String? offerCode, String? contentId}) async {
    isLoading.value = true;
    try {
      ConsentModal response = await ToneconsentApi(phoneNumber,
          offerCode: offerCode, contentId: contentId);
      consentResponse.value = response;

      await _createTuneConsentData(tuneConsentTableList, response,
          isEmpty: response.message == null);
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




// Future<void> _createTuneConsentData(
//   List<List<GenericTableViewModel>> tuneConsentTableList, ConsentModal? consentResponse) async {

//   tuneConsentTableList.clear();

//   if (consentResponse == null || consentResponse.consentStatus == null || consentResponse.consentStatus.isEmpty) {
//     tuneConsentTableList.add([
//       GenericTableViewModel(
//         columnTitle: "Template ID",
//         columnValue: "N/A", 
//         isVisible: true.obs,
//         childType: ChildType.clickableText,
//         object: consentResponse,
//       ),
//       GenericTableViewModel(
//         columnTitle: "Status",
//         columnValue: "N/A", 
//         isVisible: true.obs,
//         childType: ChildType.status,
//         object: consentResponse,
//       ),
//       GenericTableViewModel(
//         columnTitle: "Send Time",
//         columnValue: "N/A", // Set to N/A if no response
//         isVisible: true.obs,
//         object: consentResponse,
//       ),
//       GenericTableViewModel(
//         columnTitle: "Received Time",
//         columnValue: "N/A", // Set to N/A if no response
//         isVisible: true.obs,
//         object: consentResponse,
//       ),
//       GenericTableViewModel(
//         columnTitle: "Received Data",
//         columnValue: "N/A", // Set to N/A if no response
//         isVisible: true.obs,
//         object: consentResponse,
//       ),
//     ]);
//     return;
//   }

//   // If there's data, populate it normally
//   tuneConsentTableList.add([
//     GenericTableViewModel(
//       columnTitle: "Template ID",
//       columnValue: consentResponse.templateId,
//       isVisible: true.obs,
//       childType: ChildType.clickableText,
//       object: consentResponse,
//     ),
//     GenericTableViewModel(
//       columnTitle: "Status",
//       columnValue: consentResponse.consentStatus,
//       isVisible: true.obs,
//       childType: ChildType.status,
//       object: consentResponse,
//     ),
//     GenericTableViewModel(
//       columnTitle: "Send Time",
//       columnValue: consentResponse.sentTimestamp,
//       isVisible: true.obs,
//       object: consentResponse,
//     ),
//     GenericTableViewModel(
//       columnTitle: "Received Time",
//       columnValue: consentResponse.rcvTimestamp,
//       isVisible: true.obs,
//       object: consentResponse,
//     ),
//     GenericTableViewModel(
//       columnTitle: "Received Data",
//       columnValue: consentResponse.message ?? "N/A", // Use N/A if the message is null
//       isVisible: true.obs,
//       object: consentResponse,
//     ),
//   ]);
// }




// import 'package:get/get.dart';

// class ConsentController extends GetxController {

// }

// import 'package:cc_portal/Models/consent_modal.dart';
// import 'package:cc_portal/Models/generic_table_view_model.dart';
// import 'package:cc_portal/api_calls/tone_consent_api.dart';
// import 'package:cc_portal/api_calls/pack_detail_api.dart';
// import 'package:get/get.dart';
// import 'package:cc_portal/api_calls/pack_consent_api.dart'; // Import the consent API // Import the consent model

// class ConsentController extends GetxController {
//   var isLoading = false.obs;
//   var consentResponse = Rx<ConsentModel?>(null);

//   List<List<GenericTableViewModel>> tuneConsentTableList = [];
//   List<List<GenericTableViewModel>> packConsentTableList = [];

//   Future<void> fetchPackconsent(String phoneNumber,
//       {String? offerCode, String? contentId}) async {
//     try {
//       isLoading.value = true;
//       ConsentModel response = await PackconsentApi(phoneNumber,
//           offerCode: offerCode, contentId: contentId);
//       consentResponse.value = response;
//     } catch (e) {
//       print('Error fetching consent: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchToneconsent(String phoneNumber,
//       {String? offerCode, String? contentId}) async {
//     try {
//       isLoading.value = true;
    

//       ConsentModel response = await ToneconsentApi(phoneNumber,
//           offerCode: offerCode, contentId: contentId);
//       consentResponse.value = response;
//     } catch (e) {
//       print('Error fetching ToneconsentApi: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }