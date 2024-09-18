import 'package:flutter/material.dart';
import 'dart:html';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:keycloak_flutter/keycloak_flutter.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/Models/tone_detail_modal.dart';

import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';

import 'package:sm_admin_portal/enums/user_type.dart';
import 'package:sm_admin_portal/generic_table_view/generic_table_view.dart';
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
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: statusDiscription(),
        ),
        Expanded(
          child: Obx(
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
          ),
        ),
      ],
    );
  }

  Widget statusDiscription() {
    return Row(
      children: [
        Row(
          children: [
            colorBuilder(green),
            SMText(
              title: activeCStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            colorBuilder(orangeColor),
            SMText(
              title: suspendedStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            colorBuilder(yellow),
            SMText(
              title: graceCStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            colorBuilder(red),
            SMText(
              title: DeactivateStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ],
    );
  }

  Widget colorBuilder(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: Container(
        height: 10,
        width: 10,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      ),
    );
  }

  Padding mainContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //userDetail(),
          // controller.userType == UserType.newUser
          //     ? newUserView(controller)
          //     : Center(child: existingUserView(controller)),

          Expanded(child: tuneLibraryList()),
          bottomButton(context),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget tuneLibraryList() {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SMText(
                      title: myTunesStr,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: orangeColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18, right: 18, bottom: 8, top: 8),
                        child: SMText(
                          title: reachedMaxDownloadMessageStr.replaceAll(
                              "MAX_TUNE_COUNT", "$maxToneCount"),
                          textColor: white,
                          fontWeight: FontWeight.normal,
                        ),
                      )),
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: Obx(
                () {
                  return controller.isLoadingTunes.value
                      ? loadingIndicatorView()
                      : GenericTableView(
                          list: controller.tableList,
                          rowChild: ({info}) {
                            return info?.childType == ChildType.status
                                ? statusIndicator(info?.object as Tonelist)
                                : deactivateButton(info);
                          },
                        );
                },
              )),
            ],
          )
        : SizedBox();
  }

  Widget statusIndicator(Tonelist info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: info.status == "A" ? green : orangeColor,
          ),
        ),
      ],
    );
  }

  Widget deactivateButton(GenericTableViewModel? info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SMButton(
          height: 35,
          onHoverColor: sixdColor,
          onHoverTitleColor: white,
          addBorder: true,
          addHoverEffect: true,
          title: DeactivateStr,
          fontWeight: FontWeight.normal,
          onTap: () {
            print("tapped === ${info?.object}");
          },
        ),
      ],
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
            // Expanded(child: tuneListButton(context)),
            // SizedBox(width: 20),
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
      onHoverTitleColor: white,
      bgColor: white,
      onTap: () {
        context.goNamed(transactionHistoryRoute);
      },
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
      onHoverTitleColor: white,
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
