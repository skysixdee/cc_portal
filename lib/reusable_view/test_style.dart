import 'package:flutter/material.dart';

TextStyle customTextStyle(
    {FontWeight? fontWeight,
    Color? color,
    double? fontSize,
    TextDecoration? decoration,
    double? decorationThickness,
    double? height}) {
  return TextStyle(
      fontWeight: fontWeight,
      color: color,
      fontSize: fontSize,
      decoration: decoration ?? TextDecoration.none,
      decorationThickness: decorationThickness,
      height: height);
}
