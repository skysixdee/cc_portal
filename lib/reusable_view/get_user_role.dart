import 'package:cc_portal/store_manager/store_manager.dart';

List<String> getUserRole() {
  List<String> listOfRoles = [];

  for (String role
      in StoreManager().keyClockInfo?.resourceAccess?.ccPortalService?.roles ??
          []) {
    listOfRoles.add(role);
  }

  print("User roles ======= $listOfRoles");
  return listOfRoles;
}
