import 'package:flutter/material.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: SMButton(
          title: loginStr,
          onTap: () {
            keycloakService.login(KeycloakLoginOptions(
              redirectUri: 'http://10.0.10.207:9094/auth/',
            ));
          },
        ),
      ),
    );
  }
}
