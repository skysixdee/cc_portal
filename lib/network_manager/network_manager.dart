import 'dart:convert';

import 'package:universal_io/io.dart';

class NetworkManager {
  var client = HttpClient();
  Future<Map<String, dynamic>> postResquest(
      String url, Map<String, dynamic> jsonData) async {
    print("Urls sky========$url");
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.write(json.encode(jsonData));
    print("json request ${json.encode(jsonData)}");
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      try {
        String stringData = await response.transform(utf8.decoder).join();
        Map<String, dynamic> map = json.decode(stringData);
        return map;
      } catch (e) {
        String stringResp =
            """{"respCode": ${response.statusCode},"message":$e}""";
        Map<String, dynamic> map = json.decode(stringResp);
        return map;
      }
    } else {
      String code = "${response.statusCode}";
      String message = "Some thing went wrong Status code = $code";
      String stringResp = """{"respCode": $code,"message":$message}""";
      Map<String, dynamic> map = json.decode(stringResp);
      return map;
    }
  }

  static post(String s, Map<String, dynamic> requestBody) {}
}

//http://10.0.10.33:8084/selfcare/subscription-service/get-subscription















