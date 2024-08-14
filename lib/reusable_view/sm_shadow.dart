import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

List<BoxShadow> smShadow() {
  return [
    BoxShadow(
      color: grey.withOpacity(0.3),
      blurRadius: 5,
      spreadRadius: 1,
      offset: Offset(3, 3),
    )
  ];
}
