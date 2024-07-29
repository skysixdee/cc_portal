
import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
                        
class CustomTableView extends StatelessWidget {
  final List<CustomTableViewModel> headerColumList;
  final List<List<CustomTableViewModel>> rowList;
  final TextStyle? headerTextStyle;
  final TextStyle? rowTextStyle;
  final Color? borderColor;
  final Color? headerBgColor;
  final Color? cellColor;
  final double? borderWidth;
  final double? cellHeight;
  final double? headerHeight;
  //final double? SingleChildScrollView; ///////////bhavya
  final double tableMinWidth;
  final double rowVerticalPadding;
  final Function(int row, int colum)? child;
  const CustomTableView({
    super.key,
    required this.headerColumList,
    required this.rowList,
    this.headerTextStyle,
    this.rowTextStyle,
    this.borderColor,
    this.cellColor,
    this.headerBgColor = black12,
    this.borderWidth,
    this.cellHeight,
    this.child,
    this.headerHeight,
    //this.SingleChildScrollView,
    this.rowVerticalPadding = 4,
    this.tableMinWidth = 800, //////////////bhavya
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.biggest.width < tableMinWidth
            ? Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                            SizedBox(width: tableMinWidth, child: clipRRect())),
                  ),
                ],
              )
            : clipRRect();
      },
    );
  }

  ClipRRect clipRRect() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          tableHeaderView(),
          Flexible(
            child: Container(
              color: borderColor ?? Colors.grey.withOpacity(0.4),
              child: tableRowContainer(),
            ),
          ),
        ],
      ),
    );
  }

  Widget tableHeaderView() {
    return Container(
      color: headerBgColor ?? greyLight,
      height: headerHeight,
      child: Center(
        child: Obx(() {
          return Table(
            children: [
              TableRow(children: [
                for (int column = 0; column < headerColumList.length; column++)
                  if (headerColumList[column].isVisible.value)
                    Container(
                      color: headerBgColor ?? Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: column == 0
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  headerColumList[column].title,
                                  style: headerTextStyle ??
                                      const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ])
            ],
          );
        }),
      ),
    );
  }

  Widget tableRowContainer() {
    return Padding(
      padding: const EdgeInsets.all(0.50),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(3), bottomRight: Radius.circular(3)),
        child: ListView.builder(
          clipBehavior: Clip.hardEdge,
          shrinkWrap: true,
          //padding: const EdgeInsets.only(left: 1, right: 1, bottom: 1),
          itemCount: rowList.length,
          itemBuilder: (context, index) {
            return Container(
                color: white,
                child: Column(
                  children: [
                    Container(
                        height: 1, color: index == 0 ? transparent : greyLight),
                    (index == 0)
                        ? const SizedBox()
                        : Obx(() {
                            return Table(
                              children: [
                                TableRow(children: [
                                  for (int column = 0;
                                      column < rowList[index].length;
                                      column++)
                                    if (rowList[0][column].isVisible.value)
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 0,
                                            bottom:
                                                ((rowList.length - 1) == index)
                                                    ? 0
                                                    : borderWidth ?? 1),
                                        child: Container(
                                            height: cellHeight,
                                            color: cellColor ?? Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: rowVerticalPadding,
                                              ),
                                              child: Center(
                                                  child: (rowList[index][column]
                                                          .isButton)
                                                      ? ((child != null)
                                                          ? (child!(
                                                              index, column))
                                                          : const SizedBox(
                                                              child: Text(
                                                                  "add button here"),
                                                            ))
                                                      : Row(
                                                          mainAxisAlignment: column ==
                                                                  0
                                                              ? MainAxisAlignment
                                                                  .start
                                                              : MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        column ==
                                                                                0
                                                                            ? 4
                                                                            : 0),
                                                                child: Column(
                                                                  children: [
                                                                    SelectableText(
                                                                        rowList[index][column]
                                                                            .value,
                                                                        style:
                                                                            rowTextStyle,
                                                                        textAlign:
                                                                            TextAlign.start),
                                                                    // Text(
                                                                    //   rowList[index][column]
                                                                    //       .value,
                                                                    //   style:
                                                                    //       rowTextStyle,
                                                                    //   textAlign:
                                                                    //       TextAlign.start,
                                                                    // )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                            )),
                                      ),
                                ])
                              ],
                            );
                          }),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
