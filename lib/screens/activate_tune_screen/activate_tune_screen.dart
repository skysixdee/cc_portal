import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_popup.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_textfield.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_search_type_builder.dart';

class ActivateTuneScreen extends StatelessWidget {
  ActivateTuneScreen({super.key});

  final ActivateTuneController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            SMText(title: toneActivationStr),
            SizedBox(
              child:
                  activateTuneTextField(TextEditingController()), //textField(),
              width: 400,
            ),
            activateTuneSearchTypeBuilder(cont),
            SizedBox(height: 50),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: tableBuilder(),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget tableBuilder() {
    return Obx(() {
      return CustomTableView(
        headerColumList: cont.purchaseList[0],
        rowList: cont.purchaseList,
        child: (row, colum) {
          return InkWell(
            onTap: () {
              Get.dialog(
                barrierDismissible: false,
                Center(
                  child: ActivateTunePopup(
                    toneName: cont.purchaseList[row][1].value,
                  ),
                ),
              );

              print("row = $row and column = $colum");
              print("======= ${cont.purchaseList[row][1].value}");
            },
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyLight,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(
                  Icons.close,
                  size: 10,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
