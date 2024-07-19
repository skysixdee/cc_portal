import 'package:flutter/material.dart';

Widget activateTuneSearchButton() {
  return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
          size: 16,
        ),
      ));
}
