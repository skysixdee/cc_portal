import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sm_admin_portal/controllers/subscribe_detail_controller.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/custom_border_tab_view.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/search_number/search_number_view.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/pack_deatil_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

import 'widget/tone_deatil_table.dart';

class SubscriberDetailScreen1 extends StatefulWidget {
  const SubscriberDetailScreen1({super.key});

  @override
  State<SubscriberDetailScreen1> createState() =>
      _SubscriberDetailScreen1State();
}

class _SubscriberDetailScreen1State extends State<SubscriberDetailScreen1> {
  SubscriberDetailController cont = Get.find();
  Color borderColor = const Color.fromRGBO(224, 224, 224, 1);
  RxInt selectedTab = 0.obs;
  double borderWidth = 1;

  double tabButtonHeight = 45;
   List<String> tabItems = [
    packDetailsStr,
    toneDetailsStr,
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:dividerColor,
      child: ListView(
        children: [Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchNumberView(
                hintText: "hintText",
                title: "",
                onSearchTap: (searchedText) {
                  cont.getDetail(searchedText);
                  print("search tapped value is ${searchedText}");
                },
              ),
              SizedBox(height:20),
              Stack(
                children: [
                  Column(children: [
                    
                     Container(
                      height: tabButtonHeight,
                    ),
                     Container(
                      height: tabButtonHeight,
                      decoration: mainContainerDecoration(),
                     )
                
                  ],),
                  tabButtons(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTableMenuPopupButton(headerColumList: cont.list[0]),
                ],
              ),
              SizedBox(height: 8),
              Obx((){
                return selectedTab.value == 0 ?  PackDetailTable() :ToneDetailTable();
              }),
              SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 220, 218, 218),
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' 5'),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                  ),
                  SizedBox(width:5),
                  Text(
                    RecordsPerPageStr,
                    style: TextStyle(color: Colors.grey[800])
                  ),
                ],
              ),
              
            ],
          ),
        )],
      ),
    );
  }
   CustomBorderTabView tabButtons() {
    return CustomBorderTabView(
      tabButtonHeight: tabButtonHeight,
      tabItems: tabItems,
      borderWidth: borderWidth,
      borderColor:borderColor,
      onTap: (index) {
        selectedTab.value = index;
        print("Index tapped");
        print("slected tab =${tabItems[index]}");
      },
    );
  }
  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
      
      border: Border(
        top: BorderSide(
          color:borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
