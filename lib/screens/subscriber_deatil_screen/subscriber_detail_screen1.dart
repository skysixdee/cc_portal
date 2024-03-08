import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import '../../reusable_view/records_per_page_button.dart';
import 'widget/tone_deatil_table.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/custom_border_tab_view.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/search_number/search_number_view.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/pack_deatil_table.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';

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
      color: dividerColor,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchNumberWidget(),
                SizedBox(height: 10),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: tabButtonHeight,
                        ),
                        Container(
                          height: tabButtonHeight,
                          decoration: mainContainerDecoration(),
                        )
                      ],
                    ),
                    tabButtons(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Obx(() {
                      return selectedTab.value == 0
                          ? CustomTableMenuPopupButton(
                              headerColumList: cont.packDetailList[0])
                          : CustomTableMenuPopupButton(
                              headerColumList: cont.toneDetailList[0]);
                    }),
                  ],
                ),
                SizedBox(height: 8),
                Obx((){
                  return cont.isLoadingPackDetail.value || cont.isLoadingToneDetail.value ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top:50,
                      ),
                      child: Container(
                        decoration:BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:Colors.grey,
                              blurRadius:4,
                              offset:Offset(2,2),
                            )
                          ],
                          border:Border.all(
                            color: Color.fromARGB(255, 220, 218, 218),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color:Colors.white,
                        ),
                        height:100,
                        width:300,
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width:20,
                            height:20,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.blue,
                            )),
                          Text('Loading, please wait...',
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                          )), 
                        ],
                      )),
                    )
                  ): tableAndBottomSection();
                })
              ],
            ),
          )
        ],
      ),
    );
  }

Widget tableAndBottomSection(){
  return Column(children: [
                Obx(() {
                  return selectedTab.value == 0
                      ? PackDetailTable()
                      : ToneDetailTable();
                }),
                SizedBox(height: 8),
                bottomButtons(),
  ],);
}

  SearchNumberView searchNumberWidget() {
    return SearchNumberView(
                hintText: "hintText",
                title: "",
                onSearchTap: (searchedText) {
                  if(selectedTab.value == 0){
cont.getPackDetail(searchedText);
                  print("search tapped value is ${searchedText}");
                  }else{
cont.getToneDetail(searchedText);
                  }
                  
                },
              );
  }

  Row bottomButtons() {
    return Row(
                children: [
                  RecordsPageButton(),
                  
                  SizedBox(width:500),
                  
                  Text('Page'),
                  SizedBox(width:10),
                  Container(
                    width:40,
                    height:30,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      border:Border.all(
                        color:const Color.fromARGB(255, 220, 218, 218),
                        width:1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text('1')),
                  ),
                  SizedBox(width:10),
                  Text('of 1'),
                  SizedBox(width:86),
                  Container(
                     width:30,
                     height:30,
                     decoration:BoxDecoration(
                      color:Colors.grey[100],
                      borderRadius:BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),   
                      border:Border(
                        left:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        top:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        bottom:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        )),
                    ),
                    child:Center(child: Icon(
                      Icons.fast_rewind,
                      color:Colors.grey[400],
                      size:16
                      ))
                  ),
                  Container(
                     width:28,
                     height:30,
                     decoration:BoxDecoration(
                      color:Colors.grey[100],
                      border:Border(
                        left:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        top:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        bottom:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        )),    
                    ),
                    child:Center(child: Center(child: Icon(
                      Icons.skip_previous,
                      color:Colors.grey[400],
                      size:16
                      )))
                  ),
                  Container(
                     width:26,
                     height:30,
                     decoration:BoxDecoration(
                      color:Colors.grey[500],   
                    ),
                    child:Center(child: Text('1',style:TextStyle(color: Colors.white)))
                  ),
                  Container(
                     width:28,
                     height:30,
                     decoration:BoxDecoration(
                      color:Colors.grey[100],
                      border:Border(
                        right:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        top:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        bottom:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        )),     
                    ),
                    child:Center(child: Icon(
                      Icons.skip_next,
                      color:Colors.grey[400],
                      size:16
                    )),
                  ),
                  Container(
                     width:30,
                     height:30,
                     decoration:BoxDecoration(
                      color:Colors.grey[100],
                      borderRadius:BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),   
                      border:Border(
                        right:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        top:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        ),
                        bottom:BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218) 
                        )),    
                    ),
                    child:Center(child: Icon(
                      Icons.fast_forward,
                      color:Colors.grey[700],
                      size:16))
                  ),
                  
                ],
              );
  }

  

  CustomBorderTabView tabButtons() {
    return CustomBorderTabView(
      tabButtonHeight: tabButtonHeight,
      tabItems: tabItems,
      borderWidth: borderWidth,
      borderColor: borderColor,
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
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
