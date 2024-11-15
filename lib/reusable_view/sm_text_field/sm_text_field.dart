import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cc_portal/reusable_view/sm_visibility_view.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';

class SmTextField extends StatelessWidget {
  SmTextField({
    super.key,
    this.textEditingController,
    this.hint,
    this.fontSize = 15,
    this.tailingWidget,
    this.leadingWidget,
    this.onSubmit,
    this.onChange,
    this.onlyNumberInput = false,
    this.maxLength,
  });
  final TextEditingController? textEditingController;
  final RxBool _isHideClearButton = true.obs;
  final FontWeight fontWeight = FontWeight.normal;
  final double? fontSize;
  final bool onlyNumberInput;
  final String? hint;
  final int? maxLength;
  final Widget? tailingWidget;
  final Widget? leadingWidget;

  final Function(String)? onSubmit;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: textFieldDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leadingWidget ?? SizedBox(),
            Expanded(
              child: TextField(
                maxLength: maxLength,
                onSubmitted: onSubmit,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
                inputFormatters: onlyNumberInput
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : null,
                controller: textEditingController,
                onTap: () {
                  if (textEditingController?.text.isNotEmpty ?? false) {
                    _isHideClearButton.value = false;
                  }
                },
                onChanged: (value) {
                  _isHideClearButton.value = value.isEmpty;
                  if (onChange != null) {
                    onChange!(value);
                  }
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
      counterText: '',
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
      return Visibility(
        visible: !_isHideClearButton.value,
        child: InkWell(
          onTap: () {
            textEditingController?.clear();
            _isHideClearButton.value = true;
            if (onChange != null) {
              onChange!("");
            }

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
      );
      // smVisibilityView(
      //     InkWell(
      //       onTap: () {
      //         textEditingController?.clear();
      //         _isHideClearButton.value = true;
      //         print("tapped");
      //       },
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      //         child: Icon(
      //           Icons.close,
      //           size: 12,
      //         ),
      //       ),
      //     ),
      //     !_isHideClearButton.value);
    });
  }
}
