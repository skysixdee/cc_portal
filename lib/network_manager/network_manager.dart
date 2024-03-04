import 'dart:convert';

import 'package:universal_io/io.dart';

class NetworkManager {
  var client = HttpClient();
  Future<Map<String, dynamic>> postResquest(
      String url, Map<String, dynamic> jsonData) async {
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.write(json.encode(jsonData));
    print("json request ${json.encode(jsonData)}");
    HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String stringData = await response.transform(utf8.decoder).join();
      Map<String, dynamic> map = json.decode(stringData);
      return map;
    } else {
      String code = "${response.statusCode}";
      String message = "Some thing went wrong Status code = $code";
      String stringResp = """{"respCode": $code,"message":$message}""";
      Map<String, dynamic> map = json.decode(stringResp);
      return map;
    }
  }
}

//http://10.0.10.33:8084/selfcare/subscription-service/get-subscription















