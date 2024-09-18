import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget playButton(String toneId) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        onTap: () {
          print("Play button tapped $toneId");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: sixdColor,
          ),
          height: 30,
          width: 30,
          child: Icon(
            Icons.play_arrow,
            color: white,
            size: 15,
          ),
        ),
      ),
    ],
  );
}
