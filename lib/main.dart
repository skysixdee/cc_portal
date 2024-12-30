import 'dart:convert';

import 'package:cc_portal/common/cdn_script_loader.dart';
import 'package:cc_portal/controllers/consent_controller.dart';
import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cc_portal/models/keyclock_user_info_model.dart';

import 'package:cc_portal/controllers/Tone_list_controller.dart';

import 'package:cc_portal/controllers/activate_tune_controller.dart';

import 'package:cc_portal/controllers/app_controller.dart';

import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/controllers/player_controller.dart';
import 'package:cc_portal/controllers/side_menu_controller.dart';
import 'package:cc_portal/controllers/subscriber_detail_controler.dart';

import 'package:cc_portal/reusable_view/get_user_detail.dart';
import 'package:cc_portal/reusable_view/get_user_role.dart';
import 'package:cc_portal/router/router.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:url_strategy/url_strategy.dart';

late AppController appCont;
late SharedPreferences prefs;
late KeycloakService keycloakService;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  appCont = Get.put(AppController());
  prefs = await SharedPreferences.getInstance();
  await _extractValueFromPropertiesFile();
  Get.lazyPut(() => NewDashBoardController());
  bool isLoaded = await cdnScriptLoader();
  if (isLoaded) {
    await keyckockAuth();
  }

  initialize();

  runApp(const MyApp());
}

initialize() async {
  Get.lazyPut(() => SubscriberDetailController());
  Get.lazyPut(() => SideMenuController());
  Get.lazyPut(() => HistoryController());
  Get.lazyPut(() => TuneListController());
  Get.lazyPut(() => PlayerController());

  Get.lazyPut(() => ActivateTuneController());

  Get.lazyPut(() => ConsentController());

  StoreManager().initStoreManager();
  //_extractValueFromPropertiesFile();
}

Future<void> _extractValueFromPropertiesFile() async {
  try {
    final String value = await rootBundle.loadString('properties.json');
    final data = await json.decode(value);
    defaultToneId = data['DEFAULT_TONE_ID'];
    baseUrl = data['BASE_URL'];
    keyClockBaseUrl = data["KEYCLOCK_BASE_URL"];
    realmName = data["REALM_NAME"];
    clientName = data["CLIENT_ID"];

    defaultOfferCode = data['DEFAULT_OFFER_CODE'];
    countryCode = data['COUNTRY_CODE'];
    msisdnLength = data['MSISDN_LENGTH'];
    productName = data['PRODUCT_NAME'];
    maxToneCount = data['MAX_TONE_COUNT'];
    webPortal = data['WEB_PORTAL'];
    currency = data['COUNTRY_CURRENCY'];

    enablePackUpgrade = data['ENBALE_PACK_UPGRADE'] as bool;
    enablePackConsent = data['ENBALE_PACK_CONSENT'] as bool;
    enableToneConsent = data['ENBALE_TONE_CONSENT'] as bool;

    print("enablePackConsent ======= $enablePackConsent");
    print("enableToneConsent ======= $enableToneConsent");

    // "ENBALE_PACK_CONSENT":true,
    // "ENBALE_TONE_CONSENT":true
    print("default tone is ======= $defaultToneId");
  } catch (e) {
    return;
  }
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CC PORTAL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
