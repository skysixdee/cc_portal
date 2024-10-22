import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:cc_portal/Models/keyclock_user_info_model.dart';

import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/main.dart';

class StoreManager {
  static final StoreManager _instance = StoreManager._internal();

  String agentNumber = '92000003';
  String customerNumber = '92000003';

  String enLanguageSort = 'en';
  String otherLanguageSort = 'my';

  String languageSort = 'en';

  bool isEnglish = true;
  bool isAgentLoggedIn = false;
  bool isCustomerLoggedIn = false;
  late NewDashBoardController cont;
  KeyClockUserInfoModel? keyClockInfo;
  KeycloakProfile? userProfile;
  StoreManager._internal() {
    initStoreManager();
    print("initiali stro manager");
  }
  factory StoreManager() {
    return _instance;
  }

  initStoreManager() async {
    cont = Get.find();
    isAgentLoggedIn = prefs.getBool('is_agent_logged_in') ?? false;
    isCustomerLoggedIn = prefs.getBool('is_customer_logged_in') ?? false;
    isEnglish = prefs.getBool('is_english') ?? true;
    agentNumber = prefs.getString('agent_number') ?? '92000003';
    customerNumber = prefs.getString('customer_number') ?? '92000003';
    cont.isVerified.value = isCustomerLoggedIn;
  }

  setAgentLoggedin(bool isLoggedIn) {
    isAgentLoggedIn = isLoggedIn;
    prefs.setBool('is_agent_logged_in', isLoggedIn);
    print("1is loggedin ============$isLoggedIn");
  }

  setCustomerLoggedin(bool isLoggedIn) {
    isCustomerLoggedIn = isLoggedIn;
    prefs.setBool('is_customer_logged_in', isLoggedIn);
    print("is loggedin ============$isCustomerLoggedIn");
    cont.isVerified.value = isLoggedIn;
  }

  setLanguageEnglish(bool isEnglish) {
    languageSort = isEnglish ? 'en' : 'ar';
    prefs.setBool('is_english', isEnglish);
    ;
  }

  setAgentNumber(String value) async {
    agentNumber = value;
    prefs.setString('agent_number', value);
  }

  setCustomerNumber(String value) async {
    customerNumber = value;
    prefs.setString('customer_number', value);
  }

  logout() async {
    keycloakService.logout();
    cont.msisdn = '';
    StoreManager().customerNumber = '';
    StoreManager().isAgentLoggedIn = false;
    StoreManager().agentNumber = '';
    StoreManager().isCustomerLoggedIn = false;
    prefs.remove('is_agent_logged_in');
    prefs.remove('is_customer_logged_in');
    prefs.remove('is_english');
    prefs.remove('agent_number');
    prefs.remove('customer_number');
  }
}
