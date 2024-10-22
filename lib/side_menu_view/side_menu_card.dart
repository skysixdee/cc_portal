import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/reusable_drop_down_button.dart';

Widget sideSubMenuCard({required String text, required bool isSelected}) {
  return CustomOnHover(
    builder: (isHovered) {
      return Row(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 8, bottom: 8),
                child: SMText(
                  title: text,
                  textColor: (isHovered || isSelected) ? orangeColor : black,
                  fontWeight:
                      (isSelected) ? FontWeight.bold : FontWeight.normal,
                  fontSize: isSelected ? 14 : 12,
                ),
              ),
            ),
          ),
          Container(
            width: 2,
            height: 40,
            color: isSelected ? orangeColor : transparent,
          )
        ],
      );
    },
  );
}
