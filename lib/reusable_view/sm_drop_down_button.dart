import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SMDropDownButton extends StatelessWidget {
  List<String> items = [];
  SMDropDownButton({
    super.key,
    this.borderWidth = 0.7,
    this.cornerRadius = 5,
    this.heigth = 40,
    this.width,
    this.dropDownIcon,
    required this.items,
    this.onChanged,
    this.onTitleChanged,
    required PopoverDirection direction,
    this.buttonHeaderTitle = '',
    this.buttonTitle = '',
    this.buttonHintTitle,
  });

  Function(int)? onChanged;
  Function(String)? onTitleChanged;
  final double borderWidth;
  final String buttonTitle;
  final double cornerRadius;
  final double heigth;
  final double? width;
  final String? buttonHintTitle;
  final Widget? dropDownIcon;
  final String buttonHeaderTitle;
  final RxInt selectedIndex = 0.obs;
  final Color hoverColor = Colors.blue.withOpacity(0.2);
  final Color selectedColor = Colors.blue;
  final Color borderColor = Colors.grey.withOpacity(0.5);
  RxString _selectedLocalTitle = ''.obs;
  @override
  Widget build(BuildContext context) {
    selectedIndex.value = -1;
    _selectedLocalTitle.value =
        buttonTitle.isEmpty ? (buttonHintTitle ?? selectStr) : buttonTitle;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buttonHeaderTitle.isEmpty
            ? SizedBox()
            : SMText(
                title: buttonHeaderTitle,
                fontWeight: FontWeight.normal,
              ),
        ResponsiveBuilder(
          builder: (ctx, sizingInformation) {
            return InkWell(
              onTap: () {
                //if (isDisplayPopup) {
                popupOverOpen(ctx);
                //}
                print(
                    "CustomDropDownButton ${MediaQuery.of(context).size} \n ${Get.width}");
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
        Expanded(
          child: Obx(() {
            return SMText(
              title: _selectedLocalTitle.value,
              fontWeight: FontWeight.normal,
            );
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
        return Container(
          //decoration: BoxDecoration(border: Border.all(color: greyLight)),
          //color: redColor,
          child: ListView.builder(
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
          ),
        );
      },
      onPop: () => print('Popover was popped!'),
      direction: PopoverDirection.bottom,
      arrowHeight: 4,
      radius: 4,
      // width: 290,
      width: width ?? MediaQuery.of(context).size.width - 20,
      arrowWidth: 0,
    );
  }

  InkWell listCell(BuildContext context, int index, bool isHovered) {
    return InkWell(onTap: () {
      Navigator.of(context).pop();
      selectedIndex.value = index;
      _selectedLocalTitle.value = items[index];
      if (onTitleChanged != null) {
        onTitleChanged!(items[index]);
      }
      if (onChanged != null) {
        onChanged!(index);
      }
      print("index = $index and title = ${items[index]}");
    }, child: Obx(
      () {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: selectedIndex.value == index
                ? selectedColor
                : (isHovered ? hoverColor : Colors.white),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0 ? SizedBox() : Container(height: 1, color: greyLight),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: SMText(
                    fontWeight: FontWeight.normal,
                    title: items[index],
                    textColor: selectedIndex.value == index
                        ? Colors.white
                        : Colors.black),
                // Text(
                //   items[index],
                //   style: TextStyle(
                //       fontWeight: FontWeight.normal,
                //       color: selectedIndex.value == index
                //           ? Colors.white
                //           : Colors.black),
                // )
              ),
            ],
          ),
        );
      },
    ));
  }

  void refresh() {}
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
