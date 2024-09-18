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
            border: Border.all(color: greyLight),
            borderRadius: BorderRadius.circular(15),
            color: white,
          ),
          height: 30,
          width: 30,
          child: Icon(
            Icons.play_arrow,
            color: sixdColor,
            size: 15,
          ),
        ),
      ),
    ],
  );
}
