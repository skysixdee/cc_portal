import 'package:cc_portal/models/role_permission_model.dart';
import 'package:cc_portal/network_manager/network_manager.dart';
import 'package:cc_portal/utilily/urls.dart';

Future<RolePermissionModel> rolePermissionApi(String roleId) async {
  Map<String, dynamic> jsonData = {"serviceId": 1, "roleId": roleId};

  Map<String, dynamic> jsonResp =
      await NetworkManager().postResquest(rolePermissionUrl, jsonData);
  RolePermissionModel model = RolePermissionModel.fromJson(jsonResp);
  return model;
}
