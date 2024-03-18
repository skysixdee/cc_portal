import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:popover/popover.dart';

class ReusbaleDropDownButton extends StatelessWidget {
  ReusbaleDropDownButton({
    super.key,
    this.borderWidth = 1,
    this.cornerRadius = 5,
    this.heigth = 40,
    this.width,
    this.dropDownIcon,
    required this.items,
    this.onChanged,
    this.title = '',
    this.hinttext = '',
  });
  Function(int)? onChanged;
  final double borderWidth;
  final String title;
  final String hinttext;
  final double cornerRadius;
  final double heigth;
  final double? width;
  final Widget? dropDownIcon;
  final RxString selectedText = 'Select'.obs;
  final RxInt selectedIndex = 0.obs;
  final Color hoverColor = Colors.blue.withOpacity(0.2);
  final Color selectedColor = Colors.blue;
  final Color borderColor = Colors.grey.withOpacity(0.5);
  final List<String> items; // = ["Shiv", "Kumar", "Yadav"];
  @override
  Widget build(BuildContext context) {
    selectedIndex.value = -1;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        InkWell(
          onTap: () {
            print(
                "CustomDropDownButton ${MediaQuery.of(context).size} \n ${Get.width}");
            popupOverOpen(context);
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
        ),
      ],
    );
  }

  Row mainRowContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 12),
        Expanded(
          child: Obx(() {
            return Text(selectedText.value);
          }),
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
      child: dropDownIcon ??
          Icon(
            Icons.arrow_drop_down,
            color: borderColor,
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

  popupOverOpen(BuildContext context) {
    showPopover(
      context: context,
      bodyBuilder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.all(1),
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomOnHover(
              builder: (isHovered) {
                return listCell(context, index, isHovered);
              },
            );
          },
        );
      },
      onPop: () => print('Popover was popped!'),
      direction: PopoverDirection.bottom,
      arrowHeight: 4,
      radius: 4,
      width: 290, //width ?? MediaQuery.of(context).size.width - 20,
      arrowWidth: 0,
    );
  }

  InkWell listCell(BuildContext context, int index, bool isHovered) {
    return InkWell(onTap: () {
      Navigator.of(context).pop();
      selectedIndex.value = index;
      selectedText.value = items[index];
      if (onChanged != null) {
        onChanged!(index);
      }
    }, child: Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: selectedIndex.value == index
                ? selectedColor
                : (isHovered ? hoverColor : Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              items[index],
              style: TextStyle(
                  color: selectedIndex.value == index
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        );
      },
    ));
  }
}

// ignore_for_file: library_private_types_in_public_api

class CustomOnHover extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const CustomOnHover({Key? key, required this.builder}) : super(key: key);

  @override
  _CustomOnHoverState createState() => _CustomOnHoverState();
}

class _CustomOnHoverState extends State<CustomOnHover> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    // on hover animation movement matrix translation
    final hovered = Matrix4.identity()..translate(0, 0, 0);
    final transform = isHovered ? hovered : Matrix4.identity();

    // when user enter the mouse pointer onEnter method will work
    // when user exit the mouse pointer from MouseRegion onExit method will work
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 3000),
        transform: transform, // animation transformation hovered.
        child:
            widget.builder(isHovered), // build the widget passed from main.dart
      ),
    );
  }

  //used to set bool isHovered to true/false
  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}