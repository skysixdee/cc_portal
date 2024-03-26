import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sm_admin_portal/controllers/tone_active_controller.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';

import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';

// void main() {
//   runApp(MessageTemplateScreen());
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:popover/popover.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:sm_admin_portal/reusable_view/box_shadow.dart';

// import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
// import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
// import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';

// void main() {
//   runApp(MessageTemplateScreen());
// }
// void main() {
//   runApp(MessageTemplateScreen());
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MessageTemplateScreen extends StatefulWidget {
//   MessageTemplateScreen({Key? key}) : super(key: key);

//   @override
//   State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
// }

// class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
//   String selectedFrequency = 'Daily'; // Track selected frequency

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [], // Update boxShadow to fit your design
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(50.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Flexible(
//                         child: GridView.builder(
//                           itemCount: 4, // Adjust item count
//                           shrinkWrap: true,
//                           gridDelegate:
//                               SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 300,
//                             mainAxisExtent: 70,
//                             mainAxisSpacing: 20,
//                             crossAxisSpacing: 20,
//                           ),
//                           itemBuilder: (context, index) {
//                             switch (index) {
//                               case 0:
//                                 return CustomReusableTextField(
//                                   textController: TextEditingController(),
//                                   title: "Msisdn",
//                                   hintText: 'Msisdn',
//                                 );
//                               case 1:
//                                 return ReusableDropDownButton(
//                                   items: ["ToneId", "ToneName", "Artist"],
//                                   title: "Category",
//                                   onChanged: (value) {},
//                                 );
//                               case 2:
//                                 return CustomReusableTextField(
//                                   textController: TextEditingController(),
//                                   title: "Search Key",
//                                   hintText: 'Search Key',
//                                 );
//                               case 3:
//                                 return ReusableDropDownButton(
//                                   items: ["Daily", "Weekly", "Monthly"],
//                                   title: "Frequency",
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedFrequency = value ?? '';
//                                     });
//                                   },
//                                 );
//                               default:
//                                 return SizedBox();
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 if (selectedFrequency == 'Daily')
//                   ReusableDropDownButton(
//                     items: ['gshs', 'hsj', 'hsjs'],
//                     title: 'New Dropdown',
//                     onChanged: (value) {
//                       // Handle dropdown value change
//                     },
//                   ),
//                 Container(
//                   color: Colors.grey.withOpacity(0.1),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(width: 20),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           color: Colors.blue,
//                         ),
//                         width: 80,
//                         height: 33,
//                         child: Center(
//                           child: Text(
//                             'Submit',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             color: Colors.white,
//                             border: Border.all(
//                               color: Colors.black,
//                             ),
//                           ),
//                           width: 80,
//                           height: 35,
//                           child: Center(
//                             child: Text(
//                               'Reset',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomReusableTextField extends StatelessWidget {
//   final TextEditingController textController;
//   final String title;
//   final String hintText;

//   const CustomReusableTextField({
//     required this.textController,
//     required this.title,
//     required this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textController,
//       decoration: InputDecoration(
//         labelText: title,
//         hintText: hintText,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }

// class ReusableDropDownButton extends StatelessWidget {
//   final List<String> items;
//   final String title;
//   final Function(dynamic)? onChanged;

//   const ReusableDropDownButton({
//     required this.items,
//     required this.title,
//     this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       decoration: InputDecoration(
//         labelText: title,
//         border: OutlineInputBorder(),
//       ),
//       items: items.map((item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: onChanged as void Function(String?)?,
//     );
//   }
// }

// class MessageTemplateScreen extends StatefulWidget {
//   MessageTemplateScreen({Key? key}) : super(key: key);

//   @override
//   State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
// }

// class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
//   bool enableClearBtn = false;
//   String selectedFrequency = 'Daily';
//   final List<bool> cellType = [false, true, false, true, true];

//   final List<String> Heading = [
//     'Msisdn',
//     'Category',
//     'Search Key',
//     'Frequency',
//     'Service Type',
//   ];
//   final List<Widget> widgitList = [
//     CustomReusableTextField(
//       textController: TextEditingController(),
//       title: "Msisdn",
//       hintText: 'Msisdn',
//     ),
//     ReusableDropDownButton(
//         items: ["ToneId", "ToneName", "Artist"],
//         title: "Category",
//         onChanged: (value) {}),
//     CustomReusableTextField(
//       textController: TextEditingController(),
//       title: "Search Key",
//       hintText: 'Search Key',
//     ),
// ReusableDropDownButton(
//     items: ["Daily", "Weekly", "Monthly"],
//     title: "Frequeny",
//     onChanged: (value) {
//       setState(() {
//         selectedFrequency = value.toString();
//       });
//     }),
//     ReusableDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tune",
//           "Promotional Pack and tune"
//         ],
//         title: "Service Type",
//         onChanged: (value) {})
//   ];
//   final List<String> category = ['ToneId', 'ToneName', 'Artist'];
//   final List<String> frequency = ['Daily', 'Weekly', 'Monthly'];
//   final List<String> serviceType = [
//     'Promotional Pack',
//     'Promotional Tunes',
//     'Promotional Pack and Tune',
//   ];

//   int activeDropdownIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: boxShadow,
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(50.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Flexible(
//                         child: GridView.builder(
//                           itemCount: widgitList.length +
//                               (selectedFrequency == 'Daily' ? 1 : 0),
//                           shrinkWrap: true,
//                           gridDelegate:
//                               SliverGridDelegateWithMaxCrossAxisExtent(
//                             maxCrossAxisExtent: 300,
//                             mainAxisExtent: 70,
//                             mainAxisSpacing: 20,
//                             crossAxisSpacing: 20,
//                           ),
//                           itemBuilder: (context, index) {
//                             if (index == widgitList.length &&
//                                 selectedFrequency == 'Daily') {
//                               return ReusableDropDownButton(
//                                 items: ['gshs', 'hsj', 'hsjs'],
//                                 title: 'Shks',
//                                 onChanged: (value) {},
//                               );
//                             } else {
//                               return widgitList[index];
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   color: Colors.grey.withOpacity(0.1),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       SizedBox(width: 20),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(3),
//                           color: Colors.blue,
//                         ),
//                         width: 80,
//                         height: 33,
//                         child: Center(
//                           child: Text(
//                             'Submit',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 30.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(3),
//                             color: Colors.white,
//                             border: Border.all(
//                               color: Colors.black,
//                             ),
//                           ),
//                           width: 80,
//                           height: 35,
//                           child: Center(
//                             child: Text(
//                               'Reset',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomReusableTextField extends StatelessWidget {
//   final TextEditingController textController;
//   final String title;
//   final String hintText;

//   const CustomReusableTextField(
//       {required this.textController,
//       required this.title,
//       required this.hintText});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextField(
//         controller: textController,
//         decoration: InputDecoration(
//           labelText: title,
//           hintText: hintText,
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';

import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/reusable_textfield.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';


class ToneActivationScreen extends StatefulWidget {
  ToneActivationScreen({Key? key}) : super(key: key);

  @override
  State<ToneActivationScreen> createState() => _ToneActivationScreenState();
}

class _ToneActivationScreenState extends State<ToneActivationScreen> {
  ToneActiveController con = Get.put(ToneActiveController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: boxShadow,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Obx(() {
                        return GridView.builder(
                            itemCount: con.widgitList.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    mainAxisExtent: 70,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return con.widgitList[index];
                            });
                      })),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.blue,
                        ),
                        width: 80,
                        height: 33,
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          width: 80,
                          height: 35,
                          child: Center(
                            child: Text(
                              'Reset',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
