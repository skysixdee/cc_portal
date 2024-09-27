import 'package:flutter/material.dart';
import 'package:sm_admin_portal/enums/font_name.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget customTooltip(Widget child, String message) {
  return Tooltip(
    textStyle:
        TextStyle(fontWeight: FontWeight.normal, color: white, fontSize: 14),
    message: message,
    child: child,
  );
}
