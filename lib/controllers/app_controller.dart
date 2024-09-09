import 'package:get/get.dart';

class AppController extends GetxController {
  RxBool isSideMenuHidden = false.obs;
  RxString agentName = ''.obs;
  RxBool isCustomerLoggedIn = false.obs;
  RxBool isEnableBackButton = false.obs;
//  isLoading.value=true;
}
