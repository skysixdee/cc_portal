import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:go_router/go_router.dart';

import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';

import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/customer_text_field.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/existing_user_view.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/new_widget/new_user_view.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';

import 'package:sm_admin_portal/store_manager/store_manager.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
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
        return Stack(
          children: [
            controller.isVerified.value
                ? mainContainer()
                : userTextField(textEditingController, controller),
            controller.isLoading.value
                ? Container(
                    color: black12,
                    child: Center(
                      child: loadingIndicatorView(),
                    ),
                  )
                : SizedBox()
          ],
        );
      },
    );
  }

  Padding mainContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          userDetail(),
          Expanded(
              child: controller.userType == UserType.newUser
                  ? newUserView(controller)
                  : Center(child: existingUserView(controller))),
          bottomButton(context)
        ],
      ),
    );
  }

  Widget bottomButton(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 10),
          child: Container(
            color: sixdColor,
            height: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: tuneListButton(context)),
            SizedBox(width: 12),
            Expanded(child: newTuneActivateButton()),
            SizedBox(width: 12),
            Expanded(child: transactionButton()),
          ],
        ),
      ],
    );
  }

  SMButton transactionButton() {
    return SMButton(
      addBorder: true,
      height: 55,
      title: transactionHistoryStr,
      borderColor: sixdColor,
      //bgColor: sixdColor,
      //fontWeight: FontWeight.normal,
    );
  }

  SMButton newTuneActivateButton() {
    return SMButton(
      addBorder: true,
      borderColor: sixdColor,
      height: 55,
      title: ActivateNewToneStr,
      //bgColor: sixdColor,
      //fontWeight: FontWeight.normal,
      onTap: () {
        context.goNamed(activateScreenRoute);
      },
    );
  }

  Widget tuneListButton(BuildContext context) {
    String status = '';
    try {
      status = controller.offers.first.offerStatus ?? "";
    } catch (e) {}
    bool enable = (status == "A" || status == "G" || status == "S");
    return SMButton(
      height: 55,
      title: tuneListStr,
      borderColor: enable ? sixdColor : red,
      //bgColor: enable ? sixdColor : greyLight,
      //fontWeight: FontWeight.normal,
      addBorder: true,
      onTap: () {
        if (enable) {
          context.goNamed(tuneListRoute);
        }
      },
    );
  }

  Widget userDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: greyLight),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20,
                top: 14,
                bottom: 14,
                right: 50), //symmetric(horizontal: 20, vertical: 14),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: greyLight)),
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 12),
                SMText(title: countryCode),
                SMText(title: StoreManager().customerNumber)
              ],
            ),
          ),
        ),
        SMButton(
          title: "Switch Account",
          fontWeight: FontWeight.bold,
          fontSize: 12,
          leadingChild: Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              Icons.switch_account_rounded,
              //color: sixdColor,
            ),
          ),
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
