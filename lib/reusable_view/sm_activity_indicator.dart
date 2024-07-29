import 'package:flutter/cupertino.dart';

Widget smActivityIndicator({double? height, double radius = 14, Color? color}) {
  return SizedBox(
    height: height,
    child: Center(
      child: CupertinoActivityIndicator(
        radius: 14,
        color: color,
      ),
    ),
  );
}
