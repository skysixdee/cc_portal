import 'package:flutter/cupertino.dart';

Widget smActivityIndicator({double? height, double radius = 14}) {
  return SizedBox(
    height: height,
    child: Center(
      child: CupertinoActivityIndicator(
        radius: 14,
      ),
    ),
  );
}
