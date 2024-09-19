import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sm_admin_portal/controllers/player_controller.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget playButton(String toneId, String toneUrl) {
  PlayerController pCont = Get.find();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Obx(
        () {
          return InkWell(
            onTap: () {
              pCont.playUrl(toneId, toneUrl);
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
                pCont.playingToneId == toneId ? Icons.pause : Icons.play_arrow,
                color: sixdColor,
                size: 15,
              ),
            ),
          );
        },
      )
    ],
  );
}
