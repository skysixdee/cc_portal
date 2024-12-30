import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:cc_portal/main.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/strings.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: SMText(
          fontWeight: FontWeight.normal,
          textAlign: TextAlign.center,
          title:
              'Your role does not have access to this screen. \n Please change your role or contact the administrator.',
        ),
      ),
    );
  }
}
