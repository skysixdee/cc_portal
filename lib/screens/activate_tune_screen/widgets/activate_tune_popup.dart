import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_text_field.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

// class ActivateTunePopup extends StatefulWidget {
//   const ActivateTunePopup({super.key});

//   @override
//   State<ActivateTunePopup> createState() => _MyWidgetState();
// }

//class _MyWidgetState extends State<ActivateTunePopup> {
class ActivateTunePopup extends StatelessWidget {
  ActivateTunePopup({super.key});
  final ActivateTuneController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: transparent,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: white),
          width: 400,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReusbaleDropDownButton(
                          title: frequencyStr,
                          width: constraints.maxWidth,
                          items: controller.frequencyList,
                          direction: PopoverDirection.bottom,
                          hintText: "hintText"),
                      SizedBox(height: 12),
                      ReusbaleDropDownButton(
                          title: serviceTypeStr,
                          width: constraints.maxWidth,
                          items: controller.serviceTypeMenuList,
                          direction: PopoverDirection.bottom,
                          hintText: "hintText"),
                    ],
                  );
                },
              ))),
    );
  }
}
