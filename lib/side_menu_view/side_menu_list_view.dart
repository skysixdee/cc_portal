import 'package:flutter/material.dart';

Widget sideMenuListView() {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: 6,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Container(
          height: 40,
          color: Colors.white,
        ),
      );
    },
  );
}
