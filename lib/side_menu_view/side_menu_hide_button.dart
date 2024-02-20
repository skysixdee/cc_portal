import 'package:flutter/material.dart';

Widget sideMenuHideButton() {
  return InkWell(
    onTap: () {
      print("Hide button tapped");
    },
    child: const SizedBox(
      width: 30,
      height: 80,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              "H\nI\nD\nE",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 8, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Icon(
              Icons.chevron_left,
              size: 14,
              color: Colors.grey,
            )
          ],
        ),
      ),
    ),
  );
}
