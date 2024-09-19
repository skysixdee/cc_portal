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
import 'package:sm_admin_portal/reusable_view/play_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/status_bullet.dart';
import 'package:sm_admin_portal/reusable_view/table_tab_rail.dart';

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
    return Scaffold(
      backgroundColor: offWhite,
      body: Obx(
        () {
          return controller.isVerified.value
              ? mainBuilder(context)
              : userTextField(textEditingController, controller);
        },
      ),
    );
  }

  Widget mainBuilder(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: statusDiscription(),
                  ),
                  mainContainer()
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
              child: bottomButton(context),
            )
          ],
        ),
        Obx(
          () {
            return Stack(
              children: [
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
      ],
    );
  }

  Widget statusDiscription() {
    return Row(
      children: [
        Row(
          children: [
            statusBullet("A"),
            SizedBox(width: 4),
            SMText(
              title: activeStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            //colorBuilder(orangeColor),
            statusBullet("S"),
            SizedBox(width: 4),
            SMText(
              title: suspendedStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            //colorBuilder(yellow),
            statusBullet("G"),
            SizedBox(width: 4),
            SMText(
              title: graceCStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        SizedBox(width: 18),
        Row(
          children: [
            //colorBuilder(red),
            statusBullet("D"),
            SizedBox(width: 4),
            SMText(
              title: DeactiveStr,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
      ],
    );
  }

  Padding mainContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ////userDetail(),
          controller.userType == UserType.newUser
              ? newUserView(controller)
              : Center(
                  child: SizedBox(
                      width: 1000, child: existingUserView(controller))),
          SizedBox(height: 30),
          tuneLibraryList(),

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
        ? controller.isLoadingTunes.value
            ? loadingIndicatorView()
            : Container(
                color: white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      TableTabRail(
                        selectedTab: controller.selectedTab.value,
                        tabTitleList: [tuneLibraryStr, musicBoxStr],
                        onTap: (p0) {
                          controller.selectedTab.value = p0;
                        },
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          maxLimitWidget(),
                        ],
                      ),
                      //SizedBox(height: 20),

                      GenericTableView(
                        addMenuButton: true,
                        list: controller.selectedTab.value == 0
                            ? controller.tuneTableList
                            : controller.musicTableList,
                        rowChild: ({info}) {
                          Tonelist detail = info?.object as Tonelist;
                          return info?.childType == ChildType.status
                              ? statusIndicator(info?.object as Tonelist)
                              : info?.childType == ChildType.button
                                  ? deactivateButton(info)
                                  : playButton(detail.contentId ?? '',
                                      detail.contentStreamingUrl ?? '');
                        },
                      )
                    ],
                  ),
                ),
              )
        : SizedBox();
  }

  Widget morebutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomOnHover(
          builder: (isHovered) {
            return InkWell(
              onTap: () {
                Get.dialog(Center(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: white,
                  ),
                  height: 200,
                  width: 200,
                )));
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                    color: isHovered ? sixdColor : white,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: greyLight)),
                width: 35,
                child: Icon(
                  Icons.more_horiz,
                  color: isHovered ? white : sixdColor,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget maxLimitWidget() {
    return Obx(
      () {
        return Visibility(
          visible: controller.selectedTab.value == 0,
          child: Visibility(
            visible: controller.isMaxLimitMessageVisible.value,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
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
                ),
              ),
            ),
          ),
        );
      },
    );
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
          textColor: sixdColor,
          title: DeactivateStr,
          fontWeight: FontWeight.normal,
          onTap: () {
            Tonelist detail = info?.object as Tonelist;
            controller.deactivateTapped(detail.toneId, controller.packName);
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
