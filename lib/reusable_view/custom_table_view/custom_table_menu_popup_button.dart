import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/state_manager.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class CustomTableMenuPopupButton extends StatelessWidget {
  final List<CustomTableViewModel> headerColumList;
  const CustomTableMenuPopupButton({
    super.key,
    required this.headerColumList,
    this.button,
    this.borderRadius = 4,
    this.color = Colors.white,
    this.buttonHeight = 30,
    this.buttonWidth = 30,
    this.textStyle,
    this.checkBoxColor = Colors.blue,
    this.titlePadding = const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
    this.cellColor,
  });
  final Widget? button;
  final double? borderRadius;
  final Color? color;
  final Color? cellColor;
  final Color? checkBoxColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final TextStyle? textStyle;
  final EdgeInsets? titlePadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openPopOver(context);
      },
      child: button ??
          Container(
            height: buttonHeight!,
            width: buttonWidth!,
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: white,
              border: Border.all(color: greyLight),
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
            child: Icon(
              Icons.menu,
              size: buttonHeight! / 1.4,
              color: black,
            ),
          ),
    );
  }

  openPopOver(BuildContext context) {
    showPopover(
      context: context,
      bodyBuilder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          clipBehavior: Clip.hardEdge,
          child: ListView.builder(
            padding: const EdgeInsets.all(1),
            shrinkWrap: true,
            itemCount: headerColumList.length, //con.visibleRowList[0].length,
            itemBuilder: (context, index) {
              return
                  //Text("data");
                  headerColumList[index].isRemoveable
                      ? menuCell(index)
                      : const SizedBox();
            },
          ),
        );
      },
      onPop: () => print('Popover was popped!'),
      direction: PopoverDirection.bottom,
      width: 200,
      //height: 400,
      arrowHeight: 8,
      arrowWidth: 20,
    );
  }

  InkWell menuCell(int index) {
    return InkWell(
      onTap: () {
        headerColumList[index].isVisible.value =
            !headerColumList[index].isVisible.value;
        //con.createVisibleList();

        print("Index tapped $index");
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: cellColor ?? Colors.grey.withOpacity(0.2),
          child: Padding(
            padding:
                titlePadding!, // const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Obx(
              () {
                return Row(
                  children: [
                    Checkbox(
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              BorderSide(width: 2.0, color: checkBoxColor!),
                        ),
                        checkColor: Colors.white,
                        activeColor: checkBoxColor,
                        value: headerColumList[index].isVisible.value,
                        onChanged: (v) {
                          headerColumList[index].isVisible.value =
                              !headerColumList[index].isVisible.value;
                          //con.createVisibleList();
                          print("Index tapped $index");
                        }),
                    Text(
                      headerColumList[index].title.replaceAll("\n", ""),
                      style: textStyle,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
