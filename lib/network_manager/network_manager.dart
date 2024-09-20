import 'dart:convert';

import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:universal_io/io.dart';

class NetworkManager {
  var client = HttpClient();
  Future<Map<String, dynamic>> postResquest(
      String url, Map<String, dynamic> jsonData) async {
    print("Urls sky========$url");

    HttpClientRequest request = await client.postUrl(Uri.parse(url));

    request.write(json.encode(jsonData));
    print("json request ${json.encode(jsonData)}");
    try {
      HttpClientResponse response =
          await request.close().timeout(Duration(seconds: connectionTimeOut));

      if (response.statusCode == 200) {
        try {
          String stringData = await response.transform(utf8.decoder).join();

          Map<String, dynamic> map = json.decode(stringData);
          return map;
        } catch (e) {
          String message = someThingWentWrongStr + " Error = ${e.toString()}";
          Map<String, dynamic> valueMap =
              json.decode("""{"message": "${message}"}""");
          return valueMap;
        }
      } else {
        print("SKY ====== 1sky");
        print("SKY ====== 1sky ${response.connectionInfo}");

        String code = "${response.statusCode}";
        String message = someThingWentWrongStr + " Status = $code";
        Map<String, dynamic> valueMap =
            json.decode("""{"message": "${message}"}""");
        return valueMap;
      }
    } catch (e) {
      print("SKY ====== 2 ${e.toString()}");
      String message = someThingWentWrongStr;
      Map<String, dynamic> valueMap =
          json.decode("""{"message": "$message"}""");
      return valueMap;
    }
  }

  static post(String s, Map<String, dynamic> requestBody) {}
}

//http://10.0.10.33:8084/selfcare/subscription-service/get-subscription















