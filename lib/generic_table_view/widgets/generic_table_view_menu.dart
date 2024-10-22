import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';

Widget menuButton(List<GenericTableViewModel> list) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ResponsiveBuilder(
            builder: (context, si) {
              return InkWell(
                onTap: () {
                  print("tapped");
                  onTapMenu(context, list);
                },
                child: CustomOnHover(
                  builder: (isHovered) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: greyLight),
                        color: isHovered ? sixdColor : white,
                      ),
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.visibility,
                        size: 14,
                        color: isHovered ? white : black,
                      ),
                    );
                  },
                ),
              );
            },
          )),
    ],
  );
}

Future<Object?> onTapMenu(
    BuildContext context, List<GenericTableViewModel> list) {
  return showPopover(
    context: context,
    bodyBuilder: (context) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.hardEdge,
        child: ListView.builder(
          padding: const EdgeInsets.all(1),
          shrinkWrap: true,
          itemCount: list.length, //con.visibleRowList[0].length,
          itemBuilder: (context, index) {
            //if (list[index].isSelectable)
            return list[index].isRemovable
                ? InkWell(
                    onTap: () {
                      list[index].isVisible.value =
                          !list[index].isVisible.value;
                    },
                    child: _menuCell(list[index], index))
                : SizedBox();
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

Widget _menuCell(GenericTableViewModel model, int index) {
  return CustomOnHover(
    builder: (isHovered) {
      return Container(
          //decoration: BoxDecoration(color: isHovered ? sixdColor : white),
          height: 40,
          child: Obx(
            () {
              return Container(
                color: greyLight,
                child: Padding(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Container(
                    color: white,
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        Icon(
                            model.isVisible.value
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color:
                                sixdColor), //check_box_outline_blank//check_box
                        SizedBox(width: 2),
                        SMText(
                          title: model.columnTitle,
                          textColor: black,
                          fontWeight: FontWeight.normal,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
    },
  );
}
