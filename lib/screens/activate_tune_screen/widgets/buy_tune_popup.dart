import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:popover/popover.dart';

import 'package:sm_admin_portal/controllers/buy_tune_controller.dart';

import 'package:sm_admin_portal/reusable_view/sm_activity_indicator.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_drop_down_button.dart';

import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_visibility_view.dart';

import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

openBuyTunePopup(String toneName, String toneId, {Function()? onSuccess}) {
  Get.dialog(
      Center(
          child: _BuyTunePopup(
        toneName: toneName,
        toneId: toneId,
        onSuccess: onSuccess,
      )),
      barrierDismissible: false);
}

class _BuyTunePopup extends StatefulWidget {
  _BuyTunePopup(
      {required this.toneName, required this.toneId, required this.onSuccess});
  final String toneId;
  final String toneName;
  final Function()? onSuccess;
  @override
  State<_BuyTunePopup> createState() => _BuyTunePopupState();
}

class _BuyTunePopupState extends State<_BuyTunePopup> {
  late BuyTuneController cont;
  @override
  void initState() {
    cont = Get.put(BuyTuneController());

    super.initState();
  }

  @override
  void dispose() {
    print("On dispose SKY");
    Get.delete<BuyTuneController>();
    super.dispose();
  }

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
                  title: cont.errorMessage.value,
                  textColor: red,
                  fontWeight: FontWeight.normal,
                )),
              ],
            ),
          ),
          cont.errorMessage.isNotEmpty);
    });
  }

  Widget confirmButton(BuildContext context) {
    return Obx(() {
      return cont.isConfirming.value
          ? smActivityIndicator(height: 40)
          : SMButton(
              bgColor: sixdColor,
              textColor: white,
              title: confirmCStr,
              onTap: () {
                cont.confirmButtonAction(widget.toneId);

                // cont.confirmButtonAction(toneId);
                cont.onBuySuccess = () async {
                  print(" onBuySuccess on confirm tap");
                  if (widget.onSuccess != null) {
                    widget.onSuccess!();
                  }
                  Navigator.of(context).pop();
                };

                print("on confirm tap 12");
              },
            );
    });
  }

  Widget popupHeaderBuilder(BuildContext context) {
    return Container(
      color: sixdColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            Expanded(
                child: SMText(
              title: widget.toneName,
              textColor: white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              textAlign: TextAlign.center,
            )),
            closeButton(context),
          ],
        ),
      ),
    );
  }

  Widget closeButton(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.close,
          color: white,
        ));
  }

  Widget serviceTypeButton(BoxConstraints constraints) {
    return Obx(() {
      return AbsorbPointer(
        absorbing: cont.isConfirming.value,
        child: Obx(
          () {
            return Stack(
              children: [
                SMDropDownButton(
                  buttonHeaderTitle: serviceTypeStr,
                  width: constraints.maxWidth,
                  // ignore: invalid_use_of_protected_member
                  items: cont.serviceTypeMenuList.value,
                  direction: PopoverDirection.bottom,

                  onChanged: (p0) {
                    print("on shnage = $p0");
                    cont.updateServiceType(p0);
                  },
                  buttonTitle: cont.selectedServiceTitle.value,
                ),
                cont.loadingOffer.value
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(buttonCornerRadius),
                            color: sixdColor),
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            smActivityIndicator(color: white),
                            SizedBox(width: 10),
                            SMText(
                              title: loadingServiceMenuStr,
                              textColor: white,
                              fontWeight: FontWeight.normal,
                            )
                          ],
                        ),
                      )
                    : SizedBox()
              ],
            );
          },
        ),
      );
    });
  }

  Widget frequencyButton(BoxConstraints constraints) {
    return Obx(() {
      return AbsorbPointer(
        absorbing: cont.isConfirming.value,
        child: Obx(
          () {
            return SMDropDownButton(
              buttonHeaderTitle: frequencyStr,
              width: constraints.maxWidth,
              items: cont.frequencyMenuList,
              direction: PopoverDirection.bottom,
              onChanged: (index) {
                print("index sky = $index");
                cont.updateFrequency(index);
                // controller.getListOffer(index: index);
              },
              buttonTitle: cont.selectedFrequencyTitle.value,
            );
          },
        ),
      );
    });
  }
}
