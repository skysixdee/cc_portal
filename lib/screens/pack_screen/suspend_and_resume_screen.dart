import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/controllers/suspend_resume_controller.dart';
import 'package:sm_admin_portal/reusable_view/bottom_buttons.dart';

import '../../reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import '../../reusable_view/search_number/search_number_view.dart';
import '../../utilily/colors.dart';

import 'widgets/suspend_detail_table.dart';

class SuspendAndResumeScreen extends StatefulWidget {
  SuspendAndResumeScreen({super.key});

  @override
  State<SuspendAndResumeScreen> createState() => _SuspendAndResumeScreenState();
}

class _SuspendAndResumeScreenState extends State<SuspendAndResumeScreen> {
  //SuspendResumeController cont = Get.find();
  SuspendResumeController cont=Get.put(SuspendResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: greyLight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 26,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,    
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Suspend and Resume',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    SearchNumberView(
                      title: 'MSISDN',
                      hintText: 'Enter MSISDN',
                      onSearchTap: (p0) {
                        cont.msisdn = p0;
                        cont.onSearchTapAction();
                      },
                    ),
                    SizedBox(
                      height:50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Suspend And Resume List',
                          style:TextStyle(
                            fontSize: 18.0, 
                            fontWeight: FontWeight.bold
                          )
                        ),
                        CustomTableMenuPopupButton(headerColumList: cont.suspendDetailList[0]),
                      ],),
                      SizedBox(height:10),
                      SuspendDetailTable(),
                      SizedBox(height: 8),
                      BottomButtons(),
                  ]),
            ),),);
  }
}
