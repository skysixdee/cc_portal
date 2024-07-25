import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';

import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';


import 'package:sm_admin_portal/controllers/app_controller.dart';
import 'package:sm_admin_portal/controllers/side_menu_controller.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/router/router.dart';

late AppController appCont;
late SharedPreferences prefs;
void main() {
  initialize();
  runApp(const MyApp());
}

initialize() async {
  appCont = Get.put(AppController());
  Get.lazyPut(() => SubscriberDetailController());
  Get.lazyPut(() => SideMenuController());

  Get.lazyPut(() => TuneListController());

  Get.lazyPut(() => ActivateTuneController());

  prefs = await SharedPreferences.getInstance();
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
