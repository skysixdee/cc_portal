import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';

import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

import 'package:sm_admin_portal/controllers/app_controller.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/controllers/side_menu_controller.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/router/router.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

late AppController appCont;
late SharedPreferences prefs;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(const MyApp());
}

initialize() async {
  appCont = Get.put(AppController());
  Get.lazyPut(() => SubscriberDetailController());
  Get.lazyPut(() => SideMenuController());

  Get.lazyPut(() => TuneListController());

  Get.lazyPut(() => ActivateTuneController());
  Get.lazyPut(() => DashboardController());
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
