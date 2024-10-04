import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/reusable_view/sm_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

openPopover(BuildContext context, List<String> items,
    {double? width, Function(int, String)? onTap}) {
  showPopover(
    context: context,
    bodyBuilder: (context) {
      return Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(1),
          itemCount: items.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return card(context, index, items, onTap);
          },
        ),
      );
    },
    onPop: () => print('Popover was popped!'),
    direction: PopoverDirection.bottom,
    arrowHeight: 6,
    radius: 4,
    width: width ?? MediaQuery.of(context).size.width - 20,
    arrowWidth: 16,
  );
}

CustomOnHover card(BuildContext context, int index, List<String> items,
    Function(int, String)? onTap) {
  return CustomOnHover(
    builder: (isHovered) {
      return InkWell(
        onTap: () async {
          Navigator.of(context).pop();
          await Future.delayed(Duration(milliseconds: 400));
          if (onTap != null) {
            onTap(index, items[index]);
          }
          print("index = $index and title = ${items[index]}");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: (isHovered ? hoverColor : Colors.white),
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
                    fontSize: 14,
                    textColor: Colors.black),
              ),
            ],
          ),
        ),
      );
    },
  );
}
