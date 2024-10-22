import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/utilily/colors.dart';

class CustomBorderTabView extends StatelessWidget {
  CustomBorderTabView({
    super.key,
    required this.tabItems,
    required this.onTap,
    this.tabButtonHeight = 40,
    this.borderWidth = 1,
    this.borderColor = grey,
  });
  final double borderWidth;
  final double tabButtonHeight;
  final Color borderColor;
  RxInt tabIndex = 0.obs;
  final Function(int) onTap;
  final List<String> tabItems;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: borderWidth,
        child: SizedBox(
          height: tabButtonHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: tabItems.length,
            itemBuilder: (context, index) {
              return customTabButton(tabItems[index], index);
            },
          ),
        ));
  }

  Widget customTabButton(String title, int index) {
    return Obx(() {
      return InkWell(
        onTap: () {
          tabIndex.value = index;
          onTap(index);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: customTabButtonDecoration(index == tabIndex.value),
          height: tabButtonHeight,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(title,
                style: customTextDecoration(index == tabIndex.value)),
          )),
        ),
      );
    });
  }

  TextStyle customTextDecoration(bool isSelected) {
    return TextStyle(
      fontSize: 16,
      color: isSelected ? Colors.black : Colors.blue,
    );
  }

  BoxDecoration customTabButtonDecoration(bool isSelected) {
    return BoxDecoration(
      border: Border(
          top: BorderSide(
            color: isSelected ? borderColor : Colors.transparent,
            width: isSelected ? borderWidth : 0.0,
          ),
          left: BorderSide(
            color: isSelected ? borderColor : Colors.transparent,
            width: isSelected ? borderWidth : 0.0,
          ),
          right: BorderSide(
            color: isSelected ? borderColor : Colors.transparent,
            width: isSelected ? borderWidth : 0.0,
          ),
          bottom: BorderSide(
            color: !isSelected ? borderColor : Colors.transparent,
            width: !isSelected ? borderWidth : 0.0,
          )),
      color: isSelected ? Colors.white : Colors.transparent,
      //borderRadius: isSelected?BorderRadius.only(topLeft: Radius.circular(3),topRight: Radius.circular(3)):BorderRadius.only(),
    );
  }
}
