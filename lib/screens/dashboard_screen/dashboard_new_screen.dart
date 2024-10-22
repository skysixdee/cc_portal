import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:cc_portal/enums/font_name.dart';
import 'package:cc_portal/reusable_view/custom_tooltip.dart';
import 'package:cc_portal/screens/dashboard_screen/new_widget/hold_view.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:cc_portal/enums/user_type.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/router/router_name.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/reusable_view/sm_shadow.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/Models/tone_detail_modal.dart';
import 'package:cc_portal/reusable_view/status_bullet.dart';
import 'package:cc_portal/store_manager/store_manager.dart';
import 'package:cc_portal/reusable_view/table_tab_rail.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/reusable_view/custom_url_launcher.dart';
import 'package:cc_portal/reusable_view/buttons/play_button.dart';
import 'package:cc_portal/controllers/new_dash_board_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/open_generic_popup_view.dart';
import 'package:cc_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:cc_portal/screens/dashboard_screen/new_widget/new_user_view.dart';
import 'package:cc_portal/screens/dashboard_screen/new_widget/tune_consent_table.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/screens/dashboard_screen/new_widget/customer_text_field.dart';
import 'package:cc_portal/screens/dashboard_screen/new_widget/existing_user_view.dart';

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
      backgroundColor: white,
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
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Center(
                      child: SizedBox(
                        width: 1000,
                        child: statusDisctiptionBuilder(),
                      ),
                    ),
                  ),
                  mainContainer()
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 20),
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

  Widget statusDisctiptionBuilder() {
    return Visibility(
      visible: controller.userType != UserType.newUser,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: white,
                  boxShadow: smShadow()),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: statusDiscription(),
              )),
        ],
      ),
    );
  }

  Widget statusDiscription() {
    return Row(
      children: [
        activeBuilder(),
        SizedBox(width: 25),
        suspendBuilder(),
        SizedBox(width: 25),
        graceBuilder(),
        SizedBox(width: 25),
        deactivateBuilder(),
      ],
    );
  }

  Row deactivateBuilder() {
    return Row(
      children: [
        //colorBuilder(red),
        statusBullet("D"),
        SizedBox(width: 4),
        SMText(
          title: DeactiveStr,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }

  Row graceBuilder() {
    return Row(
      children: [
        //colorBuilder(yellow),
        statusBullet("G"),
        SizedBox(width: 4),
        SMText(
          title: graceCStr,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }

  Row suspendBuilder() {
    return Row(
      children: [
        //colorBuilder(orangeColor),
        statusBullet("S"),
        SizedBox(width: 4),
        SMText(
          title: suspendedStr,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }

  Row activeBuilder() {
    return Row(
      children: [
        statusBullet("A"),
        SizedBox(width: 4),
        SMText(
          title: activeStr,
          fontWeight: FontWeight.normal,
        )
      ],
    );
  }

  Padding mainContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ////userDetail(),
          controller.userType == UserType.newUser
              ? newUserView(controller)
              : (controller.userType == UserType.userOnHold)
                  ? HoldView()
                  : Center(
                      child: SizedBox(
                          width: 1000, child: existingUserView(controller))),
          SizedBox(height: 20),
          //tuneLibraryList(),
          Obx(() {
            return Visibility(
                visible: !(controller.userType == UserType.newUser ||
                    (controller.isSalatiUser.value ||
                        controller.userType == UserType.userOnHold)),
                child: tuneLibraryList());
          }),

          SizedBox(height: 20),
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
                decoration: BoxDecoration(
                    color: white,
                    boxShadow: smShadow(),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
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

                      // Directionality(
                      //   textDirection: TextDirection.rtl,
                      //child:
                      Obx(
                        () {
                          return GenericTableView(
                            addMenuButton: true,
                            list: controller.selectedTab.value == 0
                                ? controller.tuneTableList
                                : controller.musicTableList,
                            rowChild: ({info}) {
                              Tonelist detail = info?.object as Tonelist;
                              return returnWidget(
                                  info, detail, info?.childType);
                            },
                          );
                        },
                      )
                      //  )
                    ],
                  ),
                ),
              )
        : SizedBox();
  }

  Widget returnWidget(
      GenericTableViewModel? info, Tonelist detail, ChildType? childType) {
    if (childType == ChildType.status) {
      return statusIndicator(info?.object as Tonelist);
    } else if (childType == ChildType.button) {
      return deactivateButton(info);
    } else if (childType == ChildType.play) {
      return playButton(
          detail.contentId ?? '', detail.contentStreamingUrl ?? '');
    } else if (childType == ChildType.consent) {
      return viewTuneConsentButton();
    } else if (childType == ChildType.text) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SMText(
            title: _dateFormate(info?.columnValue ?? ''),
            fontWeight: FontWeight.normal,
          ),
        ],
      );
    } else {
      return SMText(title: "add you widget here");
    }
  }

  String _dateFormate(String date) {
    if (date.isEmpty) {
      return "";
    }
    String formatted = '';
    try {
      DateTime dateTime = DateTime.parse(date);
      final DateFormat formatter = DateFormat('dd-MM-yyyy, HH:mm');

      // HH:mm');
      formatted = formatter.format(dateTime);
    } catch (e) {
      formatted = e.toString();
    }

    return formatted;
  }

  Widget viewTuneConsentButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SMButton(
          addBorder: true,
          title: viewStr,
          fontWeight: FontWeight.normal,
          textColor: sixdColor,
          onTap: () {
            Get.dialog(Center(
                child:
                    Material(color: transparent, child: TuneConsentTable())));
            print("Tapped");
          },
        ),
      ],
    );
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
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: orangeColor,
                    boxShadow: smShadow()),
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
      children: [statusBullet(info.status ?? "NA")],
    );
  }

  Widget deactivateButton(GenericTableViewModel? info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SMButton(
          onHoverColor: sixdColor,
          onHoverTitleColor: white,
          addBorder: true,
          addHoverEffect: true,
          textColor: sixdColor,
          title: DeactivateStr,
          fontWeight: FontWeight.normal,
          onTap: () {
            Tonelist detail = info?.object as Tonelist;

            controller.deactivateTuneTapped(
                info, detail.contentId, controller.packName);
            print("tapped ===row ${info?.row}");
            print("tapped === colum ${info?.column}");
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
            Expanded(child: newTuneActivateButton()),
            SizedBox(width: 20),
            Expanded(
                child: controller.userType == UserType.newUser
                    ? customTooltip(
                        transactionButton(), thisFeatureNotForNewUserStr)
                    : transactionButton()),
            SizedBox(width: 20),
            Expanded(
                child: controller.userType == UserType.newUser
                    ? customTooltip(
                        CrbtPortalButton(context), thisFeatureNotForNewUserStr)
                    : CrbtPortalButton(context)),
          ],
        ),
      ],
    );
  }

  SMButton transactionButton() {
    return SMButton(
      addBorder: true,

      addHoverEffect: controller.userType == UserType.newUser ? false : true,
      onHoverColor: sixdColor,
      height: 50,
      title: transactionHistoryStr,
      boxShadow: controller.userType == UserType.newUser
          ? null
          : smShadow(blurRadius: 4, spreadRadius: 2),
      onHoverTitleColor: white,
      bgColor: white,
      textColor: controller.userType == UserType.newUser ? grey : null,
      onTap: () {
        if (controller.userType == UserType.newUser) {
          return;
        }
        context.goNamed(transactionHistoryRoute);
      },
      //bgColor: sixdColor,
      //fontWeight: FontWeight.normal,
    );
  }

  SMButton newTuneActivateButton() {
    return SMButton(
      boxShadow: smShadow(blurRadius: 4, spreadRadius: 2),
      addHoverEffect: true,
      onHoverColor: sixdColor,
      addBorder: true,
      height: 50,
      onHoverTitleColor: white,
      title: ActivateNewToneStr,
      bgColor: white,
      onTap: () {
        context.goNamed(activateScreenRoute);
      },
    );
  }

  Widget CrbtPortalButton(BuildContext context) {
    // String status = '';
    // try {
    //   status = controller.offers.first.offerStatus ?? "";
    // } catch (e) {}
    // bool enable = (status == "A" || status == "G" || status == "S");
    return SMButton(
      boxShadow: controller.userType == UserType.newUser
          ? null
          : smShadow(blurRadius: 4, spreadRadius: 2),
      addHoverEffect: controller.userType == UserType.newUser ? false : true,
      onHoverColor: sixdColor,
      height: 50,
      title: crbtPortalStr,
      textColor: controller.userType == UserType.newUser ? grey : null,
      //borderColor: enable ? sixdColor : greyLight,
      bgColor: white,
      onHoverTitleColor: white,

      //fontWeight: FontWeight.normal,
      addBorder: true,
      onTap: () {
        //context.goNamed(tuneListRoute);
        if (controller.userType == UserType.newUser) {
          return;
        }
        CustomUrlLauncher(webPortal + "/profile?token=sdfsdfsfdd");
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
