import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class SubscriberDetailController extends GetxController {
  getDetail(String PhoneNumber) async {
    String url =
        'http://10.0.10.33:8085/selfcare/subscription-service/get-subscription';
    //  jsonData: );;
    Map<String, dynamic> jsonData = {"msisdn": PhoneNumber};
    Map<String, dynamic> jsonMap =
        await NetworkManager().postResquest(url, jsonData);
    SubscribersModal modal = SubscribersModal.fromJson(jsonMap);
    print("modal =${modal.message}");
    print("modal Offers=${modal.offers?.length}");
    print("modal  respCode =${modal.respCode}");
  }
}
