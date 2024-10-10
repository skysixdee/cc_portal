import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_snack_bar.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

openPackUpgrade() {
  Get.dialog(Center(
    child: Material(
      color: transparent,
      child: _PackUpgradePopup(),
    ),
  ));
}

class _PackUpgradePopup extends StatelessWidget {
  _PackUpgradePopup({super.key});
  RxInt selectedIndex = 1.obs;
  List<String> packNameList = [
    "Daily / Rs 13.",
    "Weekly / Rs 25.",
    "Monthly / Rs 35"
  ];
  @override
  Widget build(BuildContext context) {
    selectedIndex.value = -1;
    return Container(
      width: popupWidth,
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4), color: white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headerView(context),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                packList(),
                SizedBox(height: 20),
                bottomButtonContainer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget errorMessage() {
    return Obx(() {
      return Visibility(
        visible: selectedIndex.value > 0,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SMText(
            title: selectPacknameStr,
            textColor: red,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    });
  }

  Widget headerView(BuildContext context) {
    return Container(
      color: sixdColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 40),
            headerMessage(context),
            closeButton(context),
          ],
        ),
      ),
    );
  }

  Widget headerMessage(BuildContext context) {
    return SMText(
      title: upgradePackStr.toUpperCase(),
      fontWeight: FontWeight.bold,
      textColor: white,
    );
  }

  Widget closeButton(BuildContext context) {
    return SMButton(
      titlePadding: EdgeInsets.all(0),
      height: 30,
      width: 30,
      bgColor: transparent,
      title: '',
      leadingChild: Icon(
        Icons.close,
        color: white,
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget packList() {
    return ListView.builder(
      itemCount: packNameList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return packCard(index);
      },
    );
  }

  Widget packCard(int index) {
    return InkWell(
      onTap: () {
        selectedIndex.value = index;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            Obx(
              () {
                return Icon(
                  selectedIndex.value == index
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  size: 20,
                  color: sixdColor,
                );
              },
            ),
            const SizedBox(width: 4),
            SMText(
              title: packNameList[index],
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomButtonContainer(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: cancelButton(context),
        ),
        SizedBox(width: 20),
        Expanded(
          child: confirmButton(context),
        ),
      ],
    );
  }

  Widget confirmButton(BuildContext context) {
    return Obx(
      () {
        return SMButton(
          title: confirmCStr,
          bgColor: selectedIndex.value < 0 ? greyLight : sixdColor,
          textColor: white,
          onTap: () {
            if (selectedIndex.value < 0) {
              return;
            }
            smSnackBar("upgrading", snackPosition: SnackPosition.TOP);
            print("taped");
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  SMButton cancelButton(BuildContext context) {
    return SMButton(
      title: cancelCStr,
      bgColor: greyLight,
      onTap: () {
        print("taped");
        Navigator.of(context).pop();
      },
    );
  }
}
