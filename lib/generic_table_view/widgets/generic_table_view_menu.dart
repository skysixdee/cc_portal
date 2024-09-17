import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

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
                        //border: Border.all(color: greyLight),
                        color: isHovered ? sixdColor : greyLight,
                      ),
                      height: 35,
                      width: 35,
                      child: Icon(
                        Icons.menu,
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
            return list[index].isSelectable
                ? InkWell(
                    onTap: () {
                      list[index].isVisible.value =
                          !list[index].isVisible.value;
                      list[index].isSelected = !list[index].isSelected;
                    },
                    child: _menuCell(list[index]))
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

Widget _menuCell(GenericTableViewModel model) {
  return CustomOnHover(
    builder: (isHovered) {
      return Container(
        decoration: BoxDecoration(color: isHovered ? sixdColor : white),
        height: 40,
        child: Row(
          children: [
            Icon(
                !model.isSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: isHovered
                    ? white
                    : sixdColor), //check_box_outline_blank//check_box
            SizedBox(width: 2),
            SMText(
              title: model.columnTitle,
              textColor: isHovered ? white : black,
            )
          ],
        ),
      );
    },
  );
}
