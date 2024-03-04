import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:sm_admin_portal/reusable_view/custom_border_tab_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SubscriberDetailScreen extends StatefulWidget {
  SubscriberDetailScreen({super.key});

  @override
  State<SubscriberDetailScreen> createState() => _SubscriberDetailScreenState();
}

class _SubscriberDetailScreenState extends State<SubscriberDetailScreen> {
  Color borderColor = grey;

  double borderWidth = 2;

  double tabButtonHeight = 45;
  RxList<TableHeaderModel> headerColumnList = <TableHeaderModel>[].obs;
  RxList<TableHeaderModel> headerColumnVisibleList = <TableHeaderModel>[].obs;
  // List<TableHeaderModel> menuList = [];
  String _text = ' 5';

  @override
  void initState() {
    createList();
    // createMenuList();
    createVisibleList();
    // TODO: implement initState
    super.initState();
  }

  createVisibleList() {
    headerColumnVisibleList.value = [];
    List<TableHeaderModel> visibleList = [];
    for (var element in headerColumnList) {
      if (element.isVisible.value) {
        visibleList.add(element);
      }

      print("is visible ${element.isVisible}");
    }
    print('visibleList length ${visibleList.length}');
    headerColumnVisibleList.value = visibleList;
  }

  createList() {
    headerColumnList.value = [
      TableHeaderModel(MsisdnStr, true, true.obs),
      TableHeaderModel(OfferCodeStr, true, true.obs),
      TableHeaderModel(SubscriptionStatusStr, true, true.obs),
      TableHeaderModel(ActivationDateStr, true, true.obs),
      TableHeaderModel(NextBillingDateStr, false, true.obs),
      TableHeaderModel(CpNameStr, false, true.obs),
      TableHeaderModel(ActivationChannelStr, false, true.obs),
      TableHeaderModel(ActivationTypeStr, false, true.obs),
      TableHeaderModel(DeactivateStr, false, true.obs),
    ];
  }

  // createMenuList() {
  //   menuList = [];
  //   for (var element in headerColumnList) {
  //     if (element.isSelectable) {
  //       menuList.add(element);
  //     }
  //   }
  // }

  List<String> tabItems = [
    packDetailsStr,
    toneDetailsStr,
  ];

  // List<String> cellTexts = [
  //   MsisdnStr,
  //   OfferCodeStr,
  //   SubscriptionStatusStr,
  //   ActivationDateStr,
  //   NextBillingDateStr,
  //   CpNameStr,
  //   ActivationChannelStr,
  //   ActivationTypeStr,
  //   DeactivateStr,
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dividerColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: tabButtonHeight,
                ),
                Container(
                  height: tabButtonHeight,
                  decoration: mainContainerDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child:
                         ResponsiveBuilder(
                           builder: (context, SizingInformation){
                           return InkWell(
                             onTap: () {
                           showPopover(
                             context: context,
                             bodyBuilder: (context) => topDropDownItems(),
                             direction: PopoverDirection.bottom,
                             width: 300,
                             height: 150,
                             arrowHeight: 10,
                             arrowWidth: 20,
                           );
                         },
                             child: Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   border: Border.all(
                                     color: Color.fromARGB(255, 220, 218, 218),
                                   ),
                                   borderRadius: BorderRadius.circular(5)),
                               child: Icon(Icons.menu), //topDropDownWidget(),
                             ),
                           );
                         }
                         ),
                      ),
                      /*Widget topDropDownWidget() {
                              return ResponsiveBuilder(
                                builder: (context, sizingInformation) {
                                  return IconButton(
                                      onPressed: () {
                                        showPopover(
                                          context: context,
                                          bodyBuilder: (context) => topDropDownItems(),
                                          direction: PopoverDirection.bottom,
                                          width: 300,
                                          height: 150,
                                          arrowHeight: 10,
                                          arrowWidth: 20,
                                        );
                                      },
                                      icon: Icon(Icons.menu));
                                },
                              );
                            } */
                    ],
                  ),
                ),
                tableContaniner(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 220, 218, 218),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: dropDownWidget()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14, left: 7),
                      child: Text(RecordsPerPageStr,
                          style: TextStyle(color: Colors.grey[800])),
                    )
                  ],
                )
              ],
            ),
            tabButtons()
          ],
        ),
      ),
    );
  }

  Container tableContaniner() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Obx(() {
                return Table(
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      children: tableHeaderWidget(),
                    ),
                    //tableRow()
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  CustomBorderTabView tabButtons() {
    return CustomBorderTabView(
      tabButtonHeight: tabButtonHeight,
      tabItems: tabItems,
      borderWidth: borderWidth,
      borderColor: borderColor,
      onTap: (index) {
        print("Index tapped");
        print("selected tab =${tabItems[index]}");
      },
    );
  }

  TableRow tableRow() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        children: [
          tableColumnText("832008988"),
          tableColumnText("CRBT"),
          tableColumnText("A"),
          tableColumnText('2024-02-14 09:25:45'),
          tableColumnText('2024-02-15'),
          tableColumnText('Content Connect Africa'),
          tableColumnText(""),
          tableColumnText("FREE"),
          deleteButtonWidget(),
        ]);
  }

  List<Widget> tableHeaderWidget() {
    return List.generate(headerColumnVisibleList.length, (index) {
      return TableCell(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              headerColumnVisibleList[index].title,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      );
    });
  }

  TableCell deleteButtonWidget() {
    return TableCell(
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.only(
            top: 14,
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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

  Widget tableColumnText(String title) {
    return TableCell(
      child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
              padding: EdgeInsets.all(8),
              child:
                  Text(title, style: TextStyle(fontWeight: FontWeight.w500)))),
    );
  }

  Widget dropDownWidget() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return Row(
          children: [
            Text(_text,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),),
                InkWell(
                  onTap:(){
                    showPopover(
                    context: context,
                    bodyBuilder: (context) => DropDownItems(),
                    direction: PopoverDirection.bottom,
                    width: 100,
                    height: 170,
                    arrowHeight: 10,
                    arrowWidth: 20,
                    );
                  },
                  child:Container(
                     child:Icon(
                      Icons.arrow_drop_down
                     )
                  ),)
           /* IconButton(
                onPressed: () {
                  showPopover(
                    context: context,
                    bodyBuilder: (context) => DropDownItems(),
                    direction: PopoverDirection.bottom,
                    width: 100,
                    height: 170,
                    arrowHeight: 10,
                    arrowWidth: 20,
                  );
                },
                icon: Icon(Icons.arrow_drop_down)), */
          ],
        );
      },
    );
  }

  DropDownItems() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 5, right: 5),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            int value = (index + 1) * 5;
            return InkWell(
                onTap: () {
                  _updateTextField(' $value');
                },
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Center(
                      child: Text(
                        ' $value',
                        style: TextStyle(
                            fontFamily: 'Roboto', fontWeight: FontWeight.w900),
                      ),
                    )));
          },
        ));
  }

  void _updateTextField(String text) {
    setState(() {
      _text = text;
    });
  }

/*Widget topDropDownWidget() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return IconButton(
            onPressed: () {
              showPopover(
                context: context,
                bodyBuilder: (context) => topDropDownItems(),
                direction: PopoverDirection.bottom,
                width: 300,
                height: 150,
                arrowHeight: 10,
                arrowWidth: 20,
              );
            },
            icon: Icon(Icons.menu));
      },
    );
  } */

  Widget topDropDownItems() {
    return ListView.builder(
      itemCount: headerColumnVisibleList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: headerColumnVisibleList[index].isSelectable
              ? menuCell(headerColumnVisibleList[index].title,
                  headerColumnVisibleList[index])
              : SizedBox(),
        );
      },
    );
  }

  Widget menuCell(String title, TableHeaderModel item) {
    return Obx(() {
      return InkWell(
        onTap: () {
          item.isVisible.value = !item.isVisible.value;
          createVisibleList();
        },
        child: Row(
          children: [
            Icon(item.isVisible.value
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked),
            Text(title)
          ],
        ),
      );
    });
  }
}

/*
TopDropDownItems() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Flexible(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            children: [
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  //color: const Color.fromRGBO(225, 190, 231, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (newValue) {},
                      activeColor: Colors.blue,
                    ),
                    Text('msisdn',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          //fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  //color: const Color.fromRGBO(206, 147, 216, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const Center(
                    child: Text('10',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900))),
              ),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  //color: const Color.fromRGBO(186, 104, 200, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const Center(
                    child: Text('15',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900))),
              ),
              Container(
                height: 30,
                decoration: const BoxDecoration(
                  //color: const Color.fromRGBO(171, 71, 188, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const Center(
                    child: Text('20',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900))),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
*/

/*
bool border=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: border?ButtonBorder():null,
                  child: TextButton(
                    child: Text(
                      'Pack Details',
                      style:GoogleFonts.inter(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      )
                    ),
                    onPressed:(){
                      border=true;
                      ButtonBorder();
                    }, 
                  ),
                ),
                TextButton(
                  style:TextButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      //side:BorderSide(color:Colors.grey)
                    )
                  ),
                  child: Text(
                    'Tone Details',
                    style:GoogleFonts.inter(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    )
                  ),
                  onPressed:(){}, 
                ),
              ],),
              Container(
                height:1,
                color:Colors.grey,
              )
          ],
        ),
          
      ),
    );
  }

  BoxDecoration ButtonBorder() {
    return BoxDecoration(
                  border:Border(
                    top:BorderSide(color:Colors.grey),
                    left:BorderSide(color:Colors.grey),
                    right:BorderSide(color:Colors.grey),
                  ) );
  }

*/
class TableHeaderModel {
  String title;
  bool isSelectable;
  RxBool isVisible;
  TableHeaderModel(this.title, this.isSelectable, this.isVisible);
}
