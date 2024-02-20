import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget sideMenuFooterView() {
  return Container(
    color: Colors.black12,
    height: 30,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          poweredByStr,
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ),
    ),
  );
}
