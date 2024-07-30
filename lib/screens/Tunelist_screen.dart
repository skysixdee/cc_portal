import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/Tone_list_controller.dart';
import 'package:sm_admin_portal/reusable_view/bottom_buttons.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class TuneListScreen extends StatefulWidget {
  const TuneListScreen({super.key});

  @override
  State<TuneListScreen> createState() => _TuneListScreenState();
}

class _TuneListScreenState extends State<TuneListScreen> {
  final TuneListController cont = Get.find();

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
    cont.getToneList(cont.searchedText);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          color: dividerColor,
          child: cont.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          tableAndBottomSection(),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      );
    });
  }

  Widget tableAndBottomSection() {
    return Center(
      child: Column(
        children: [
          SettingsListTable(),
          SizedBox(height: 8),
          BottomButtons(),
        ],
      ),
    );
  }
}

// class TuneListScreen extends StatefulWidget {
//   const TuneListScreen({super.key});

//   @override
//   State<TuneListScreen> createState() => _TuneListScreenState();
// }

// class _TuneListScreenState extends State<TuneListScreen> {
//   TuneListController cont = Get.find();

//   Color borderColor = const Color.fromRGBO(224, 224, 224, 1);
//   RxInt selectedTab = 0.obs;
//   double borderWidth = 1;

//   double tabButtonHeight = 45;
//   List<String> tabItems = [
//     packDetailsStr,
//     toneDetailsStr,
//   ];

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 2), () {
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: Container(
//               color: dividerColor,
//               child: isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(28.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               // searchNumberWidget(),
//                               SizedBox(height: 10),
//                               // Stack(
//                               //   children: [
//                               //     Column(
//                               //       children: [
//                               //         Container(
//                               //           height: tabButtonHeight,
//                               //         ),
//                               //         Container(
//                               //           height: tabButtonHeight,
//                               //           //      decoration: mainContainerDecoration(),
//                               //         )
//                               //       ],
//                               //     ),
//                               //     //tabButtons(),
//                               //     // Obx(() {
//                               //     //   return SMText(title:
//                               //     //       'items are =${cont.toneList[0].length}');
//                               //     // })
//                               //   ],
//                               // ),

//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.end,
//                               //   crossAxisAlignment: CrossAxisAlignment.end,
//                               //   children: [
//                               //     Obx(() {
//                               //       return selectedTab.value == 0
//                               //           ? CustomTableMenuPopupButton(
//                               //               headerColumList: cont.packDetailList[0])
//                               //           : CustomTableMenuPopupButton(
//                               //               headerColumList: cont.settingsList[0]);
//                               //     }),
//                               //   ],
//                               // ),
//                               SizedBox(height: 8),

//                               tableAndBottomSection()

//                               //dropDownWidget(),
//                               //   Row(
//                               //   children: [
//                               //     InkWell(
//                               //       onTap: () {
//                               //         showPopover(
//                               //         context: context,
//                               //         bodyBuilder: (context) => topDropDownItems(),
//                               //         direction: PopoverDirection.bottom,
//                               //         width: 300,
//                               //         height: 150,
//                               //         arrowHeight: 10,
//                               //         arrowWidth: 20,
//                               // );
//                               //       },
//                               // child: Container(
//                               //   decoration: BoxDecoration(
//                               //       color: Colors.white,
//                               //       border: Border.all(
//                               //         color: const Color.fromARGB(255, 220, 218, 218),
//                               //       ),
//                               //       borderRadius: BorderRadius.circular(5)),
//                               //         child: Row(
//                               //           mainAxisAlignment: MainAxisAlignment.center,
//                               //           children: [
//                               //             Text(' 5'),
//                               //             Icon(Icons.arrow_drop_down),
//                               //           ],
//                               //         ),
//                               //       ),
//                               //     ),
//                               //     SizedBox(width: 5),
//                               //     Text(RecordsPerPageStr,
//                               //         style: TextStyle(color: Colors.grey[800])),
//                               //   ],
//                               // )

// //                   return
//                               // ,  Obx(() {
//                               //     return cont.isLoadingPackDetail.value ||
//                               //             cont.isLoadingSettingsList.value
//                               //         ? loadingIndicatorView()
//                               //         : selectedTab.value == 0
//                               //             ? (cont.packDetailList.length < 2
//                               //                 ? noDataContainer()
//                               //                 : tableAndBottomSection())
//                               //             : (cont.settingsList.length < 2
//                               //                 ? noDataContainer()
//                               //                 : tableAndBottomSection());
//                               //   }),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//             )));
//   }

//   Center loadingIndicatorView() {
//     return Center(
//         child: Padding(
//       padding: const EdgeInsets.only(
//         top: 50,
//       ),
//       child: Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 blurRadius: 4,
//                 offset: Offset(2, 2),
//               )
//             ],
//             border: Border.all(
//               color: Color.fromARGB(255, 220, 218, 218),
//             ),
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//           ),
//           height: 100,
//           width: 300,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                   width: 20,
//                   height: 20,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 3,
//                     color: Colors.blue,
//                   )),
//               Text('Loading, please wait...',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                   )),
//             ],
//           )),
//     ));
//   }

//   Widget tableAndBottomSection() {
//     return Center(
     
//       child: Column(
//         children: [
//           SettingsListTable(),
//           SizedBox(height: 8),
//           BottomButtons(),
//         ],
//       ),
//     );
//   }

//   CustomBorderTabView tabButtons() {
//     return CustomBorderTabView(
//       tabButtonHeight: tabButtonHeight,
//       tabItems: tabItems,
//       borderWidth: borderWidth,
//       borderColor: borderColor,
//       onTap: (index) {
//         selectedTab.value = index;
//         if (selectedTab.value == 0) {
//           CircularProgressIndicator();
//           //cont.getToneList(msisdnCStr);
//           //cont.getToneList(cont.searchedText);
//           //cont.getPackDetail(cont.searchedText);
//         } else {
//           // cont.ToneList();
//         }
//         print("Index tapped");
//         print("slected tab =${tabItems[index]}");
//       },
//     );
//   }
// }




