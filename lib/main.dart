import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sm_admin_portal/Models/keyclock_user_info_model.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';

import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

import 'package:sm_admin_portal/controllers/app_controller.dart';

import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/controllers/player_controller.dart';
import 'package:sm_admin_portal/controllers/side_menu_controller.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';

import 'package:sm_admin_portal/reusable_view/get_user_detail.dart';
import 'package:sm_admin_portal/reusable_view/get_user_role.dart';
import 'package:sm_admin_portal/router/router.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

late AppController appCont;
late SharedPreferences prefs;
late KeycloakService keycloakService;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
// below code added for key clock login remove if not requiredVVVVVVVVVVVVVVVVV
  try {
    keycloakService = KeycloakService(KeycloakConfig(
      url: 'http://10.0.13.19:9070/', // Keycloak auth base url
      realm: 'CC-PORTAL',
      clientId: 'CC-PORTAL-SERVICE',
    ));
    bool isAuth = await keycloakService.init(
      initOptions: KeycloakInitOptions(onLoad: 'login-required'),
    );
    print("is aut =========== $isAuth");
    String token = await keycloakService.getToken();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    StoreManager().keyClockInfo =
        await keyClockUserInfoModelFromJson(json.encode(decodedToken));

    print(
        "iskeycloakService.authenticated =========== ${keycloakService.authenticated}");
    if (keycloakService.authenticated as bool) {
      StoreManager().setAgentLoggedin(true);
      getUserRole();
      getUserDetail();
    }

    print("is aut =========== ${keycloakService}");
  } catch (e) {
    print("error is $e");
  }
// Above code added for key clock login remove if not required^^^^^^^^^^^^^^^^^

  runApp(const MyApp());
}

initialize() async {
  appCont = Get.put(AppController());
  Get.lazyPut(() => SubscriberDetailController());
  Get.lazyPut(() => SideMenuController());

  Get.lazyPut(() => TuneListController());
  Get.lazyPut(() => PlayerController());

  Get.lazyPut(() => ActivateTuneController());

  Get.lazyPut(() => NewDashBoardController());

  prefs = await SharedPreferences.getInstance();
  StoreManager().initStoreManager();
  _extractValueFromPropertiesFile();
}

_extractValueFromPropertiesFile() async {
  try {
    final String value = await rootBundle.loadString('properties.json');
    final data = await json.decode(value);
    defaultToneId = data['DEFAULT_TONE_ID'];
    defaultOfferCode = data['DEFAULT_OFFER_CODE'];
    countryCode = data['COUNTRY_CODE'];
    msisdnLength = data['MSISDN_LENGTH'];
    productName = data['PRODUCT_NAME'];
    maxToneCount = data['MAX_TONE_COUNT'];
    webPortal = data['WEB_PORTAL'];

    enablePackUpgrade = data['ENBALE_PACK_UPGRADE'] as bool;
    enablePackConsent = data['ENBALE_PACK_CONSENT'] as bool;
    enableToneConsent = data['ENBALE_TONE_CONSENT'] as bool;

    print("enablePackConsent ======= $enablePackConsent");
    print("enableToneConsent ======= $enableToneConsent");

    // "ENBALE_PACK_CONSENT":true,
    // "ENBALE_TONE_CONSENT":true
    print("default tone is ======= $defaultToneId");
  } catch (e) {
    return '';
  }
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
