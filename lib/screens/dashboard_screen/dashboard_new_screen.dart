import 'package:flutter/material.dart';
import 'dart:html';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';

import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';

import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/open_generic_popup_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/Tunelist_screen.dart';
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
          //userDetail(),
          controller.userType == UserType.newUser
              ? newUserView(controller)
              : Center(child: existingUserView(controller)),

          Expanded(child: tuneListTableView()),
          bottomButton(context),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget tuneListTableView() {
    String status = '';
    try {
      status = controller.offers.first.offerStatus ?? "";
    } catch (e) {}
    bool enable = (status == "A" || status == "G" || status == "S");
    return enable
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SMText(
                      title: myTunesStr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                  child: TuneListScreen(
                isAddPadding: false,
              )),
            ],
          )
        : SizedBox();
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
            SizedBox(width: 20),
            Expanded(child: newTuneActivateButton()),
            SizedBox(width: 20),
            Expanded(child: transactionButton()),
          ],
        ),
      ],
    );
  }

  SMButton transactionButton() {
    return SMButton(
      addBorder: true,
      addHoverEffect: true,
      onHoverColor: sixdColor,
      height: 55,
      title: transactionHistoryStr,
      boxShadow: smShadow(),
      bgColor: white,
      //bgColor: sixdColor,
      //fontWeight: FontWeight.normal,
    );
  }

  SMButton newTuneActivateButton() {
    return SMButton(
      boxShadow: smShadow(),
      addHoverEffect: true,
      onHoverColor: sixdColor,
      addBorder: true,
      height: 55,
      title: ActivateNewToneStr,
      bgColor: white,
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
      boxShadow: enable ? smShadow() : null,
      addHoverEffect: enable,
      onHoverColor: sixdColor,
      height: 55,
      title: tuneListStr,
      textColor: enable ? black : black.withOpacity(0.2),
      //borderColor: enable ? sixdColor : greyLight,
      bgColor: enable ? white : hoverColor,
      //fontWeight: FontWeight.normal,
      addBorder: enable,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: white,
              boxShadow: smShadow(),
              //border: Border.all(color: greyLight),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 20),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
          title: switchAccountStr,
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
            openGenericPopup(
              headerTitle: switchAccountStr.toUpperCase(),
              areYouSureYouWantToChangeUserStr,
              secondryButtonTitle: cancelCStr,
              primaryButtonTitle: confirmCStr,
              primaryAction: () {
                controller.isVerified.value = false;
                controller.msisdn = '';
                textEditingController.text = '';
                StoreManager().setCustomerLoggedin(false);
              },
            );
          },
        )
      ],
    );
  }
}
