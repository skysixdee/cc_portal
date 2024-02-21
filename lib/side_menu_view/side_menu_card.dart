import 'package:flutter/material.dart';

Widget sideMenuCard(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 1),
    child: Container(
      height: 40,
      child: Text(text),
    ),
  );
}
