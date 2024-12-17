import 'package:cc_portal/utilily/colors.dart';
import 'package:popover/popover.dart';
import 'package:flutter/material.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DatePickerButton extends StatelessWidget {
  List<String> items = [];
  DatePickerButton({
    super.key,
    this.borderWidth = 0.7,
    this.cornerRadius = 5,
    this.heigth = 40,
    this.width,
    this.title = '',
    this.onTap,
    required this.selectedText,
  });

  final double borderWidth;
  final String title;

  final double cornerRadius;
  final double heigth;
  final double? width;

  final Color hoverColor = Colors.blue.withOpacity(0.2);
  final Color selectedColor = Colors.blue;
  final Color borderColor = Colors.grey.withOpacity(0.5);

  final Function()? onTap;
  final Widget selectedText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.isEmpty
            ? SizedBox()
            : SMText(
                title: title,
                fontWeight: FontWeight.normal,
              ),
        ResponsiveBuilder(
          builder: (ctx, sizingInformation) {
            return InkWell(
              onTap: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(cornerRadius),
                child: Stack(
                  children: [
                    Container(
                      height: heigth,
                      width: width,
                      clipBehavior: Clip.hardEdge,
                      decoration: mainDecoration(),
                      child: mainRowContainer(),
                    ),
                    leftRedLine()
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Row mainRowContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 12),
        Expanded(child: selectedText
            //     SMText(
            //   title: selectedText,
            //   fontWeight: FontWeight.normal,
            // )
            ),
        _buttondivider(),
        _dropDownIcon()
      ],
    );
  }

  Padding _buttondivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        width: borderWidth * 1.2,
        color: borderColor,
      ),
    );
  }

  Widget _dropDownIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Icon(
        size: 18,
        Icons.calendar_month,
        color: black,
      ),
    );
  }

  BoxDecoration mainDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(cornerRadius),
      border: Border.all(color: borderColor, width: borderWidth),
    );
  }

  Container leftRedLine() {
    return Container(
      height: 40,
      width: borderWidth * 3,
      color: Colors.red,
    );
  }
}
