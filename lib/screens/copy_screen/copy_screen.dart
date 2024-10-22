import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/controllers/copy_tone_controller.dart';
import 'package:cc_portal/reusable_view/bottom_buttons.dart';
import 'package:cc_portal/screens/copy_screen/widgets/copy_detail_table.dart';
import 'package:cc_portal/screens/copy_screen/widgets/sf_calender.dart';
import 'package:cc_portal/utilily/colors.dart';

import '../../reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import '../../reusable_view/search_number/search_number_view.dart';

class CopyScreen extends StatefulWidget {
  const CopyScreen({super.key});

  @override
  State<CopyScreen> createState() => _CopyScreenState();
}

class _CopyScreenState extends State<CopyScreen> {
  CopyTonecontroller cont = Get.put(CopyTonecontroller());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: dividerColor,
            child: ListView(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Copy Tone',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 50),
                              CalendarPopoverButton(),
                            ],
                          ),
                          SizedBox(height: 4),
                          SearchNumberView(
                            title: 'Friends Msisdn',
                            hintText: 'Enter MSISDN',
                            onSearchTap: (p0) {
                              cont.msisdn = p0;
                              cont.onSearchTapAction();
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Obx(() {
                                  return CustomTableMenuPopupButton(
                                    headerColumList: cont.copyDetailList[0],
                                  );
                                })
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Obx(() {
                            return cont.isLoadingCopyTonedetail.value
                                ? loadingIndicatorView()
                                : (cont.copyDetailList.length < 2
                                    ? noDataContainer()
                                    : tableAndBottomSections());
                          }),
                          SizedBox(height: 20),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget tableAndBottomSections() {
    return Column(
      children: [
        CopyDetailTable(),
        SizedBox(height: 8),
        BottomButtons(),
      ],
    );
  }

  Center loadingIndicatorView() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(
        top: 50,
      ),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
            border: Border.all(
              color: Color.fromARGB(255, 220, 218, 218),
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 100,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.blue,
                  )),
              Text('Loading, please wait...',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
            ],
          )),
    ));
  }

  Container noDataContainer() {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 194, 194, 194).withOpacity(0.6),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        width: 1000,
        height: 300,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                color: Colors.grey[300],
              ),
              width: 1000,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Row(children: [
                  for (int i = 0; i < 6; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          color: Colors.grey[100],
                          height: 20,
                        ),
                      ),
                    ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Image.asset(
                'assets/pngs/cloud.png',
                width: 150,
                height: 150,
              ),
            ),
            Text(
              'Hey, looks like there is no data to show!',
              style: TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
