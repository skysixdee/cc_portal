import 'package:cc_portal/router/router_name.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/models/role_permission_model.dart';

String roleBaseScreen(String path) {
  print("redirect to path = $path");
  RolePermissionModel roleModel = StoreManager().rolePermission;

  if (roleModel.allScreens ?? false) {
    return path;
  } else {
    String customPath = path.replaceAll('/', '');
    bool isAllowed =
        roleModel.screens?.any((scr) => scr.screenName == customPath) ?? false;

    if (isAllowed) {
      return path;
    } else {
      return roleRoute;
    }
  }
}
