import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

List<BoxShadow> smShadow({double blurRadius = 8, double spreadRadius = 1}) {
  return [
    BoxShadow(
      color: grey.withOpacity(0.5),
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      //offset: Offset(3, 3),
    )
  ];
}
