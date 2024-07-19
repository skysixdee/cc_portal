import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_text_field.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/reusable_view/sm_activity_indicator.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/pack_deatil_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTunePopup extends StatelessWidget {
  ActivateTunePopup({super.key, required this.toneName});

  final ActivateTuneController controller = Get.find();
  final String toneName;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: white),
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                popupHeaderBuilder(context),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 10),
                            frequencyButton(constraints),
                            SizedBox(height: 12),
                            serviceTypeButton(constraints),
                            SizedBox(height: 20),
                            confirmButton(),
                            SizedBox(height: 10),
                          ],
                        );
                      },
                    )),
              ],
            )),
      ),
    );
  }

  Widget confirmButton() {
    return Obx(() {
      return controller.isConfirming.value
          ? smActivityIndicator(height: 40)
          : SMButton(
              bgColor: sixdColor,
              textColor: white,
              title: confirmCStr,
              onTap: () {
                controller.confirmButtonAction();
                print("on confirm tap");
              },
            );
    });
  }

  Widget popupHeaderBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 30),
          Expanded(
              child: SMText(
            title: toneName,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            textAlign: TextAlign.center,
          )),
          closeButton(context),
        ],
      ),
    );
  }

  Widget closeButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.close));
  }

  ReusbaleDropDownButton serviceTypeButton(BoxConstraints constraints) {
    return ReusbaleDropDownButton(
        title: serviceTypeStr,
        width: constraints.maxWidth,
        items: controller.serviceTypeMenuList,
        direction: PopoverDirection.bottom,
        hintText: "hintText");
  }

  ReusbaleDropDownButton frequencyButton(BoxConstraints constraints) {
    return ReusbaleDropDownButton(
        title: frequencyStr,
        width: constraints.maxWidth,
        items: controller.frequencyList,
        direction: PopoverDirection.bottom,
        hintText: "hintText");
  }
}
