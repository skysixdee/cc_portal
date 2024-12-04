import 'package:cc_portal/api_calls/role_permission_api.dart';
import 'package:cc_portal/enums/role_type.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

Future<void> getUserRole() async {
  List<String> listOfRoles = [];

  for (String role
      in StoreManager().keyClockInfo?.resourceAccess?.ccPortalService?.roles ??
          []) {
    if (role == 'super_admin') {
      //StoreManager().roleType = RoleType.superAdmin;
      StoreManager().rolePermission = await rolePermissionApi("3");
    } else if (role == 'admin') {
      //StoreManager().roleType = RoleType.admin;
      StoreManager().rolePermission = await rolePermissionApi('2');
    } else {
      //StoreManager().roleType = RoleType.agent;
      StoreManager().rolePermission = await rolePermissionApi('1');
    }
    listOfRoles.add(role);
  }

  print("User roles ======= $listOfRoles");
  return;
}
