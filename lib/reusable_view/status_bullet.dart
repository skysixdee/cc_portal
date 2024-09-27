import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget statusBullet(String status) {
  print("status code = $status");
  if (status == 'A') {
    return _statusCircleBuilder(green);
  } else if (status == 'G') {
    return _statusCircleBuilder(yellow);
  } else if (status == 'S') {
    return _statusCircleBuilder(orangeColor);
  } else if (status == 'D') {
    return _statusCircleBuilder(red);
  } else {
    return SMText(title: newUserStr);
  }
}

Widget _statusCircleBuilder(Color color) {
  return Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: color,
    ),
  );
}
