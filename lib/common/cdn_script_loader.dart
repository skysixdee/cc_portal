import 'dart:async';
import 'dart:html' as html;

import 'package:cc_portal/main.dart';
import 'package:cc_portal/models/keyclock_user_info_model.dart';
import 'package:cc_portal/reusable_view/get_user_detail.dart';
import 'package:cc_portal/reusable_view/get_user_role.dart';
import 'package:cc_portal/router/router_name.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';

Future<bool> cdnScriptLoader() async {
  final completer = Completer<bool>();

  try {
    String url = '$keyClockBaseUrl/js/keycloak.js';
    print("Keycloak script URL: $url");

    final script = html.ScriptElement()
      ..src = url
      ..type = 'text/javascript'
      ..async = true;

    html.document.body?.append(script);

    // Listen for successful load
    script.onLoad.listen((event) {
      print("keycloak.js loaded successfully");
      completer.complete(true); // Resolve with true on success
    });

    // Listen for errors
    script.onError.listen((event) {
      print("Failed to load keycloak.js");
      completer.complete(false); // Resolve with false on failure
    });

    // Wait for the script to finish loading
    return await completer.future;
  } catch (e) {
    print("Error in loading script: $e");
    return false; // Return false if an exception occurs
  }
}

Future<void> keyckockAuth() async {
  // below code added for key clock login remove if not requiredVVVVVVVVVVVVVVVVV
  try {
    keycloakService = KeycloakService(KeycloakConfig(
      url: '$keyClockBaseUrl/', // Keycloak auth base url
      realm: realmName,
      clientId: clientName,
    ));
    bool isAuth = await keycloakService.init(
      initOptions: KeycloakInitOptions(onLoad: 'login-required'),
    );
    print("is aut =========== $isAuth");
    String token = await keycloakService.getToken();

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    KeyClockUserInfoModel model = KeyClockUserInfoModel.fromJson(decodedToken);
    StoreManager().keyClockInfo = model;
    print("model ========== ${model.realmAccess?.roles}");
    print(
        "iskeycloakService.authenticated =========== ${keycloakService.authenticated}");
    if (isAuth) {
      StoreManager().setAgentLoggedin(true);
      await getUserRole();
      getUserDetail();

      return;
    }

    print("is aut =========== ${keycloakService}");
  } catch (e) {
    print("error is2 $e");
    return;
  }
// Above code added for key clock login remove if not required^^^^^^^^^^^^^^^^^
}
