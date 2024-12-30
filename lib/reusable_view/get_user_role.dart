import 'package:cc_portal/api_calls/role_permission_api.dart';

import 'package:cc_portal/store_manager/store_manager.dart';

Future<void> getUserRole() async {
  List<String> roles = StoreManager().keyClockInfo?.realmAccess?.roles ?? [];
  if (roles.any((role) => role == "super_admin")) {
    StoreManager().rolePermission = await rolePermissionApi("3");
  } else if (roles.any((role) => role == "admin")) {
    StoreManager().rolePermission = await rolePermissionApi("2");
  } else if (roles.any((role) => role == "agent")) {
    StoreManager().rolePermission = await rolePermissionApi("1");
  } else {}
  return;
}
