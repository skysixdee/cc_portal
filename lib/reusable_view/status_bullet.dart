import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget statusBullet(String status) {
  if (status == 'A') {
    return _statusCircleBuilder(green);
  } else if (status == 'G') {
    return _statusCircleBuilder(yellow);
  } else if (status == 'S') {
    return _statusCircleBuilder(orangeColor);
  } else {
    return _statusCircleBuilder(red);
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
