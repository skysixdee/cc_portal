import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:popover/popover.dart';

import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';

import 'package:sm_admin_portal/reusable_view/sm_activity_indicator.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_visibility_view.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ActivateTunePopup extends StatelessWidget {
  ActivateTunePopup({super.key, required this.toneName, required this.toneId});

  final ActivateTuneController controller = Get.find();

  final String toneId;
  final String toneName;
  @override
  Widget build(BuildContext context) {
    controller.updateFrequency('');
    controller.updateSelectedServiceType("", '');
    controller.isConfirming.value = false;
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
                            errorMessage(),
                            confirmButton(context),
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

  Widget errorMessage() {
    return Obx(() {
      return smVisibilityView(
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Flexible(
                    child: SMText(
                  title: controller.errorMessage.value,
                  textColor: redColor,
                  fontWeight: FontWeight.normal,
                )),
              ],
            ),
          ),
          controller.errorMessage.isNotEmpty);
    });
  }

  Widget confirmButton(BuildContext context) {
    return Obx(() {
      return controller.isConfirming.value
          ? smActivityIndicator(height: 40)
          : SMButton(
              bgColor: sixdColor,
              textColor: white,
              title: confirmCStr,
              onTap: () {
                controller.confirmButtonAction(toneId);
                controller.onBuySuccess = () async {
                  print(" onBuySuccess on confirm tap");
                  Navigator.of(context).pop();
                };
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

  Widget serviceTypeButton(BoxConstraints constraints) {
    return Obx(() {
      return AbsorbPointer(
        absorbing: controller.isConfirming.value,
        child: SMDropDownButton(
          buttonHeaderTitle: serviceTypeStr,
          width: constraints.maxWidth,
          // ignore: invalid_use_of_protected_member
          items: controller.serviceTypeMenuList.value,
          direction: PopoverDirection.bottom,

          onChanged: (p0) {
            print("on shnage = $p0");
            controller.updateSelectedServiceType(
                controller.serviceTypeValueList[p0],
                controller.serviceTypeMenuList[p0]);
          },
          buttonTitle: controller.selectedServiceTypeTitle,
        ),
      );
    });
  }

  Widget frequencyButton(BoxConstraints constraints) {
    return Obx(() {
      return AbsorbPointer(
        absorbing: controller.isConfirming.value,
        child: SMDropDownButton(
          buttonHeaderTitle: frequencyStr,
          width: constraints.maxWidth,
          items: controller.frequencyList,
          direction: PopoverDirection.bottom,
          onChanged: (index) {
            print("index sky = $index");
            controller.updateFrequency(controller.frequencyList[index]);
            controller.getListOffer(index: index);
          },
          buttonTitle: controller.selectedFrequency,
        ),
      );
    });
  }
}
