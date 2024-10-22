import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

getUserDetail() async {
  KeycloakProfile? userProfile = await keycloakService.loadUserProfile();
  StoreManager().userProfile = userProfile;
  appCont.agentName.value =
      userProfile?.firstName ?? userProfile?.username ?? '';
  print("user detail = ${userProfile?.firstName}");
}
