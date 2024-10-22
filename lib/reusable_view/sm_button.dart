import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cc_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

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
    this.borderColor = greyLight,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 26),
    this.fontWeight = FontWeight.w600,
    this.fontSize = 14,
    this.leadingChild,
    this.boxShadow,
    this.addHoverEffect = false,
    this.onHoverColor = greyLight,
    this.onHoverTitleColor,
  });
  final double? height;
  final double? width;
  final String title;
  final Color? textColor;
  final Color? bgColor;
  final Color borderColor;
  final bool addBorder;
  final double? fontSize;
  final EdgeInsetsGeometry titlePadding;
  final FontWeight fontWeight;
  final Widget? leadingChild;
  final List<BoxShadow>? boxShadow;
  final bool addHoverEffect;
  final Color onHoverColor;
  final Color? onHoverTitleColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      if (onTap != null) {
        onTap!();
      }
    }, child: CustomOnHover(
      builder: (isHovered) {
        return Container(
          decoration: BoxDecoration(
              border: addBorder ? Border.all(color: borderColor) : null,
              color: addHoverEffect
                  ? (isHovered ? onHoverColor : bgColor)
                  : bgColor,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(buttonCornerRadius)),
          height: height,
          width: width,
          child: Center(
            child: Padding(
              padding: titlePadding,
              child: leadingChild != null
                  ? Row(
                      children: [
                        leadingChild!,
                        SMText(
                          title: title,
                          textColor: addHoverEffect
                              ? (isHovered ? onHoverTitleColor : textColor)
                              : textColor,
                          fontSize: fontSize,
                          fontWeight: fontWeight,
                        )
                      ],
                    )
                  : SMText(
                      title: title,
                      textColor: addHoverEffect
                          ? (isHovered ? onHoverTitleColor : textColor)
                          : textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
            ),
          ),
        );
      },
    ));
  }
}
