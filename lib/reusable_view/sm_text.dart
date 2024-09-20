import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class SMText extends StatelessWidget {
  const SMText({
    super.key,
    required this.title,
    this.fontWeight = FontWeight.w600,
    this.textColor = black,
    this.textAlign,
    this.fontSize = 15,
  });
  final FontWeight fontWeight;
  final String title;
  final Color? textColor;
  final double? fontSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight, color: textColor, fontSize: fontSize),
    );
  }
}
