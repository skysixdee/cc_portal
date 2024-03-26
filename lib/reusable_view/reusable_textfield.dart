import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class CustomReusableTextField extends StatelessWidget {
  // final String title;
  CustomReusableTextField({
    super.key,
    this.borderWidth = 1,
    this.cornerRadius = 5,
    this.heigth = 40,
    this.width,
    this.hintText,
    this.onChange,

    this.onSubmit,
    required this.textController,
    this.isNumberInput = false,
    this.title = '',
    
    required Null Function(),
    required Null Function(dynamic value) onChanged, required bool isrequired,
  });

  final double borderWidth;
  final double cornerRadius;
  final double heigth;
  final double? width;
  final String? hintText;
  final String title;
  final bool isNumberInput;
  final Function(String)? onChange;
  final Function(String)? onSubmit;


  final RxBool isHideClear = true.obs;
  final TextEditingController textController;
  final Color borderColor = Colors.grey.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerWidget(),
            ClipRRect(
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
          ],
        );
      },
    );
  }

  Visibility headerWidget() {
    return Visibility(
      visible: title.isNotEmpty,
      child: SMText(
        title: title,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Row mainRowContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 12),
        Expanded(
            child: TextField(
          onTap: () {
            isHideClear.value = textController.text.isEmpty;
          },
          onChanged: (value) {
            isHideClear.value = value.isEmpty;
            if (onChange != null) {
              onChange!(value);
            }
          },
          onSubmitted: (value) {
            if (onSubmit != null) {
              onSubmit!(value);
            }
          },
          controller: textController,
          style: const TextStyle(fontSize: 14),
          inputFormatters: isNumberInput
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            isDense: true,
            hintStyle: const TextStyle(fontSize: 12),
          ),
        )),
        Obx(() {
          return Visibility(
            visible: !isHideClear.value,
            child: _clearIcon(),
          );
        })
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

  Widget _clearIcon() {
    return InkWell(
      onTap: () {
        textController.text = '';
        isHideClear.value = true;
        if (onChange != null) {
          onChange!("");
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 6, right: 12),
        child: Icon(
          Icons.close,
          size: 17,
          color: borderColor,
        ),
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
