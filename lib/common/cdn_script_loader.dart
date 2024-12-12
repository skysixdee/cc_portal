/*
import 'dart:html' as html;

import 'package:cc_portal/utilily/constants.dart';

Future<String> cdnScriptLoader() async {
  try {
    String url = keyClockBaseUrl + '/js/keycloak.js';
    print("key clock url = $url");
    final script = html.ScriptElement()
      ..src = 'http://10.0.13.19:9070/js/keycloak.js'
      ..type = 'text/javascript'
      ..async = true;

    html.document.body?.append(script);

    script.onLoad.listen((event) {
      print("keycloak.js loaded successfully");
    });
    return "";
  } catch (e) {
    print("erorr is $e");
    return "";
  }
}
*/