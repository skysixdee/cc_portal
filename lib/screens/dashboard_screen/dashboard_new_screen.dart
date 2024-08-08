import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/enums/font_name.dart';
import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_text_field/sm_text_field.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/customer_text_field.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/existing_user_view.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/new_user_view_builder.dart';
import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class DashboardNewScreen extends StatefulWidget {
  const DashboardNewScreen({super.key});

  @override
  State<DashboardNewScreen> createState() => _DashboardNewScreenState();
}

class _DashboardNewScreenState extends State<DashboardNewScreen> {
  final NewDashBoardController controller = Get.find();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isVerified.value
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    userDetail(),
                    Expanded(
                        child: controller.userType == UserType.newUser
                            ? newUserBuilder(controller)
                            : existingUserView(controller)),
                    bottomButton()
                  ],
                ),
              )
            : userTextField(textEditingController, controller);
      },
    );
  }

  Widget bottomButton() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            color: sixdColor,
            height: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            tuneListButton(),
            newTuneActivateButton(),
            transactionButton(),
          ],
        ),
      ],
    );
  }

  SMButton transactionButton() {
    return SMButton(
        height: 35,
        title: transactionHistoryStr,
        bgColor: sixdColor,
        fontWeight: FontWeight.normal,
        textColor: white);
  }

  SMButton newTuneActivateButton() {
    return SMButton(
        height: 35,
        title: ActivateNewToneStr,
        bgColor: sixdColor,
        fontWeight: FontWeight.normal,
        textColor: white);
  }

  SMButton tuneListButton() {
    return SMButton(
        height: 35,
        title: tuneListStr,
        bgColor: sixdColor,
        fontWeight: FontWeight.normal,
        textColor: white);
  }

  Widget userDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: greyLight)),
              child: Icon(Icons.person),
            ),
            SizedBox(width: 8),
            SMText(title: StoreManager().customerNumber)
          ],
        ),
        SMButton(
          addBorder: true,
          borderColor: greyLight,
          title: "Switch Account",
          leadingChild: Icon(Icons.switch_account_rounded),
          onTap: () {
            controller.isVerified.value = false;
            controller.msisdn = '';
            textEditingController.text = '';
            StoreManager().setCustomerLoggedin(false);
          },
        )
      ],
    );
  }
}
