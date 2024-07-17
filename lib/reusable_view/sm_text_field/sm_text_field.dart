import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/sm_visibility_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

class SmTextField extends StatelessWidget {
  SmTextField({
    super.key,
    this.textEditingController,
    this.hint,
    this.fontSize = 14,
    this.tailingWidget,
  });
  final TextEditingController? textEditingController;
  final RxBool _isHideClearButton = true.obs;
  final FontWeight fontWeight = FontWeight.w500;
  final double? fontSize;
  final String? hint;
  final Widget? tailingWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: textFieldDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
                controller: textEditingController,
                onChanged: (value) {
                  _isHideClearButton.value = value.isEmpty;
                },
                decoration: inutDecortion(),
              ),
            ),
            tailingWidget ?? SizedBox()
          ],
        ),
      ),
    );
  }

  InputDecoration inutDecortion() {
    return InputDecoration(
      isDense: true,
      hintText: hint,
      border: InputBorder.none,
      suffix: clearButton(),
    );
  }

  BoxDecoration textFieldDecoration() {
    return BoxDecoration(
        border: Border.all(color: greyLight),
        borderRadius: BorderRadius.circular(4));
  }

  Widget clearButton() {
    return Obx(() {
      return smVisibilityView(
          InkWell(
            onTap: () {
              textEditingController?.clear();
              _isHideClearButton.value = true;
              print("tapped");
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Icon(
                Icons.close,
                size: 12,
              ),
            ),
          ),
          !_isHideClearButton.value);
    });
  }
}
