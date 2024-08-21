import 'package:flutter/material.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';

class KeyClockScreen extends StatelessWidget {
  const KeyClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SMButton(
          title: "Login",
          onTap: () async {
            keycloakService.login(KeycloakLoginOptions(
              redirectUri: 'http://10.0.10.207:9094/auth/',
            ));
          },
        ),
        SMButton(
          title: "Print Token",
          onTap: () async {
            String token = await keycloakService.getToken();
            print("token = $token");
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
            bool isUpdated = await keycloakService.updateToken();
            print("is updated = $isUpdated");
          },
        ),
      ],
    );
  }
}
