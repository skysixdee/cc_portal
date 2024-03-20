import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

class SMButton extends StatelessWidget {
  const SMButton({
    super.key,
    this.height = 40,
    this.width,
    required this.title,
    this.onTap,
    this.textColor,
    this.bgColor,
    this.addBorder = false,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 36),
  });
  final double? height;
  final double? width;
  final String title;
  final Color? textColor;
  final Color? bgColor;
  final bool addBorder;
  final EdgeInsetsGeometry titlePadding;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: addBorder ? Border.all(color: grey) : null,
            color: bgColor,
            borderRadius: BorderRadius.circular(buttonCornerRadius)),
        height: height,
        width: width,
        child: Center(
          child: Padding(
            padding: titlePadding,
            child: SMText(
              title: title,
              textColor: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}