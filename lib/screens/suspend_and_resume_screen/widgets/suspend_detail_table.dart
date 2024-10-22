import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:cc_portal/controllers/suspend_resume_controller.dart';
import 'package:cc_portal/reusable_view/bottom_buttons.dart';
import 'package:cc_portal/utilily/colors.dart';

import '../../../reusable_view/custom_table_view/custom_table_view.dart';

// class SuspendDetailTable extends StatelessWidget {
//   SuspendDetailTable({super.key});
//   SuspendResumeController cont = Get.find();
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Container(
//           child: CustomTableView(
//             cellHeight: 60,
//             headerHeight: 60,
//             headerBgColor: Colors.grey[300],
//             headerColumList: cont.suspendDetailList[0],
//             rowList: cont.suspendDetailList,
//             button: (row, colum) {
//               return ResponsiveBuilder(builder: (context, sizingInformation) {
//                 return InkWell(
//                   onTap: () {
//                     showPopover(
//                       radius: 4,
//                       context: context,
//                       bodyBuilder: (context) {
//                         return DropDownItems1(context, row, colum);
//                       },
//                       direction: PopoverDirection.bottom,
//                       width: 110,
//                       arrowHeight: 10,
//                       arrowWidth: 20,
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(
//                           color: const Color.fromARGB(255, 220, 218, 218),
//                         ),
//                         borderRadius: BorderRadius.circular(5)),
//                     child: Icon(Icons.arrow_drop_down),
//                   ),
//                 );
//               });

//               // InkWell(
//               //   onTap: () {
//               //     // cont.packDetailList.removeAt(row);
//               //      //final offerName = cont.suspendDetailList[row][1].value;
//               //     //cont.deletePack(offerName,row);
//               //   },
//               //   child: Icon(
//               //     Icons.clear,
//               //   size: 25
//               //   ),
//               // );
//             },
//           ),
//         ),
//       );
//     });
//   }

//   DropDownItems1(BuildContext context, int? row, int? colum) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           InkWell(
//             onTap: () {
//               print("row = $row and colum = $colum");

//               Navigator.of(context).pop();
//               //cont.changeStatus();
//               cont.suspendService(row! - 1);
//             },
//             child: Container(
//               width: 110,
//               height: 40,
//               child: Center(
//                 child: Text(
//                   'Suspend',
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               cont.resumeService(row! - 1);
//               Navigator.of(context).pop();
//               // cont.suspendService();
//             },
//             child: Container(
//               width: 110,
//               height: 40,
//               child: Center(
//                 child: Text(
//                   'Resume',
//                   style: TextStyle(
//                     fontFamily: 'Roboto',
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]);
//   }
// }

////////////////////////////
import 'package:flutter/material.dart';
// Import your suspend_resume_controller.dart file

class SuspendAndResumeScreen extends StatefulWidget {
  SuspendAndResumeScreen({Key? key}) : super(key: key);

  @override
  State<SuspendAndResumeScreen> createState() => _SuspendAndResumeScreenState();
}

class _SuspendAndResumeScreenState extends State<SuspendAndResumeScreen> {
  final SuspendResumeController cont =
      SuspendResumeController(); // Define cont here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyLight,
      body: ListView(
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
                  Text(
                    'Suspend and Resume',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Other widgets
                  SizedBox(height: 15),
                  tableAndBottomSections(), // Pass cont to the SuspendDetailTable
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tableAndBottomSections() {
    return Column(
      children: [
        SuspendDetailTable(
            cont: cont), // Pass cont instance to SuspendDetailTable
        SizedBox(height: 8),
        BottomButtons(),
      ],
    );
  }
}

class SuspendDetailTable extends StatelessWidget {
  SuspendDetailTable({Key? key, required this.cont});

  final SuspendResumeController cont; // Receive cont instance here

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: 1000,
              // Adjust width as needed
              child: Obx(() {
                return CustomTableView(
                  cellHeight: 60,
                  headerHeight: 60,
                  headerBgColor: Colors.grey[300],
                  headerColumList: cont.suspendDetailList[0],
                  rowList: cont.suspendDetailList,
                  childWidget: (row, colum) {
                    return ResponsiveBuilder(
                        builder: (context, sizingInformation) {
                      return InkWell(
                        onTap: () {
                          showPopover(
                            radius: 4,
                            context: context,
                            bodyBuilder: (context) {
                              return DropDownItems1(context, row, colum);
                            },
                            direction: PopoverDirection.bottom,
                            width: 110,
                            arrowHeight: 10,
                            arrowWidth: 20,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 220, 218, 218),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      );
                    });
                  },
                );
              }),
            ),
          ),
        ));
  }

  Widget loadingIndicatorView() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
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
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Loading, please wait...',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropDownItems1(BuildContext context, int? row, int? colum) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              print("row = $row and colum = $colum");

              Navigator.of(context).pop();
              loadingIndicatorView();
              //cont.changeStatus();
              cont.suspendService(row! - 1);
            },
            child: Container(
              width: 110,
              height: 40,
              child: Center(
                  child: Text(
                'Suspend',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                ),
              )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return loadingIndicatorView();
                  });

              cont.resumeService(row! - 1).then((_) {
                Navigator.of(context).pop();

                // cont.suspendService();
              });
            },
            child: Container(
              width: 110,
              height: 40,
              child: Center(
                child: Text(
                  'Resume',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
