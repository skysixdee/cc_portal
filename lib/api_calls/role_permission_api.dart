import 'dart:convert';

import 'package:cc_portal/models/role_permission_model.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<RolePermissionModel> rolePermissionApi(String roleId) async {
  Map<String, dynamic> jsonData = {"serviceId": 1, "roleId": roleId};

  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(rolePermissionUrl, jsonData);
  RolePermissionModel model = RolePermissionModel.fromJson(jsonResp);
  // RolePermissionModel model =
  //     RolePermissionModel.fromJson(json.decode(_jsonResp1));
  // print("reole screens = ${model.screens}");
  return model;
}

String _jsonResp1 = """{
    "role_id": 2,
    "role_name": "Admin",
    "all_screens": false,
    "all_actions": true,
    "screens": [
        {
            "screen_id": 1,
            "screen_name": "Dashboard"
        },
        {
            "screen_id": 2,
            "screen_name": "Subscriptions"
        },{
            "screen_id": 2,
            "screen_name": "activateScreen"
        }
    ],
    "actions": []}""";
//activateScreen
