import 'package:flutter/material.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/reusable_view/get_user_role.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/store_manager/store_manager.dart';

class KeyClockScreen extends StatelessWidget {
  const KeyClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SMButton(
          title: "Login",
          onTap: () async {
            bool isLo = await keycloakService.isLoggedIn();
            print("is authenticated in ${keycloakService.authenticated}");
            print("is isLoggedIn in $isLo");

            if (isLo) {
              print("user is already authenticated");
            } else {
              print("user is not  loggedin so");
              keycloakService.login(KeycloakLoginOptions(
                redirectUri: 'http://10.0.10.207:9094/auth/',
              ));
            }
          },
        ),
        SMButton(
          title: "Print Token",
          onTap: () async {
            String token = await keycloakService.getToken();
            print("token = $token");
            getUserRole();
          },
        ),
        SMButton(
          title: "Logout",
          onTap: () {
            keycloakService.logout();
          },
        ),
        SMButton(
          title: "Update token",
          onTap: () async {
            bool isUpdated = await keycloakService.updateToken(1000);
            print("is updated = $isUpdated");
          },
        ),
        SMButton(
          title: "Get Profile",
          onTap: () async {
            KeycloakProfile? userProfile =
                await keycloakService.loadUserProfile();
            print("User email = ${userProfile?.email}");
            print("User emailVerified = ${userProfile?.emailVerified}");
            print("User firstName = ${userProfile?.firstName}");
            print("User id = ${userProfile?.id}");
            print("User lastName = ${userProfile?.lastName}");
            print("User username = ${userProfile?.username}");
          },
        ),
      ],
    );
  }
}
