import 'package:cc_portal/enums/role_type.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

List<String> getUserRole() {
  List<String> listOfRoles = [];

  for (String role
      in StoreManager().keyClockInfo?.resourceAccess?.ccPortalService?.roles ??
          []) {
    if (role == 'super_admin') {
      StoreManager().roleType = RoleType.superAdmin;
    } else if (role == 'admin') {
      StoreManager().roleType = RoleType.admin;
    } else {
      StoreManager().roleType = RoleType.agent;
    }
    listOfRoles.add(role);
  }

  print("User roles ======= $listOfRoles");
  return listOfRoles;
}
