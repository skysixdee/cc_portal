import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.rightWidget,
      this.addDropDown = false,
      this.onDropDownTap});
  final Widget? rightWidget;
  final bool addDropDown;
  final Function(String)? onDropDownTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: mainContainerDecoration(),
      height: 40,
      width: 300,
      child: Row(
        children: [
          Container(height: double.infinity, color: redColor, width: 2),
          const Flexible(child: TextField()),
          clearButtonWidget(),
          addDropDown ? dropDownButton() : const SizedBox(),
          rightWidget ?? const SizedBox()
        ],
      ),
    );
  }

  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
        border: Border.all(color: black),
        borderRadius: BorderRadius.circular(2));
  }

  Icon clearButtonWidget() => const Icon(Icons.close);

  Widget dropDownButton() {
    return InkWell(
        onTap: () {
          if (onDropDownTap != null) {
            onDropDownTap!("SKY");
          }

          print(" in side class Tapped");
        },
        child: const Icon(Icons.arrow_drop_down));
  }
}
