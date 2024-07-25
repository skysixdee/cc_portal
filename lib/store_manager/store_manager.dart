import 'package:sm_admin_portal/main.dart';

class StoreManager {
  static final StoreManager _instance = StoreManager._internal();

  String agentNumber = '92000003';
  String customerNumber = '92000003';
  String languageCode = 'en';
  bool isEnglish = true;
  bool isAgentLoggedIn = false;
  bool isCustomerLoggedIn = false;

  StoreManager._internal() {
    initStoreManager();
    print("initiali stro manager");
  }
  factory StoreManager() {
    return _instance;
  }

  initStoreManager() async {
    isAgentLoggedIn = prefs.getBool('is_agent_logged_in') ?? false;
    isCustomerLoggedIn = prefs.getBool('is_customer_logged_in') ?? false;
    isEnglish = prefs.getBool('is_english') ?? true;
    agentNumber = prefs.getString('agent_number') ?? '92000003';
    customerNumber = prefs.getString('customer_number') ?? '92000003';
  }

  setAgentLoggedin(bool isLoggedIn) {
    isAgentLoggedIn = isLoggedIn;
    prefs.setBool('is_agent_logged_in', isLoggedIn);
  }

  setCustomerLoggedin(bool isLoggedIn) {
    isCustomerLoggedIn = isLoggedIn;
    prefs.setBool('is_customer_logged_in', isLoggedIn);
  }

  setLanguageEnglish(bool isEnglish) {
    languageCode = isEnglish ? 'en' : 'ar';
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
    prefs.remove('is_agent_logged_in');
    prefs.remove('is_customer_logged_in');
    prefs.remove('is_english');
    prefs.remove('agent_number');
    prefs.remove('customer_number');
  }
}
