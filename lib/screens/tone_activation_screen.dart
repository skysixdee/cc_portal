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
// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import 'package:sm_admin_portal/utilily/strings.dart';

// class ToneActiveController extends GetxController {
//   bool isFrequencySelected = false;

//   RxList<Widget> widgitList = <Widget>[].obs;

//   void onInit() {
//     super.onInit();
//     createListOfWidget();
//   }

//   createListOfWidget() {
//     widgitList.value = [
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Msisdn",
//         hintText: 'Msisdn',
//         onChange: (p0) {
//           onChangeMsisdn(p0);
//         },
//         onSubmit: (p0) {
//           onChangeMsisdn(p0);
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: ["ToneId", "ToneName", "Artist"],
//         title: "Category",
//         onTap: () {},
//         onChanged: (value) {
//           if (value == 0) {
//             print("Tone id tapped");

//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: toneIdStr,
//               hintText: toneIdStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           } else if (value == 1) {
//             print("Tone name tapped");
//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: ToneNameStr,
//               hintText: ToneNameStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           } else if (value == 2) {
//             print("Artist tapped");
//             widgitList[2] = CustomReusableTextField(
//               textController: TextEditingController(),
//               title: ArtistStr,
//               hintText: ArtistStr,
//               onChange: (p0) {
//                 print("Changed");
//               },
//             );
//           }
//           print("Vlaue is $value");
//           // searchkeyto("ToneId");

//           // searchkeyto("Artist");
//         },
//       ),
//       CustomReusableTextField(
//         textController: TextEditingController(),
//         title: "Search Key",
//         hintText: 'Search Key',
//         onChange: (p0) {
//           print("Changed");
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: ["Daily", "Weekly", "Montly"],
//         title: "Frequeny",
//         onChanged: (p0) {
//           updateStatus();
//         },
//       ),
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tone",
//           "Promotional Pack and Tone"
//         ],
//         title: "Service Type",
//         onChanged: (value) {},
//       ),
//     ];
//   }

//   onChangeMsisdn(String value) {
//     print("Value is $value");
//   }

//   updateStatus() {
//     print("Items are ${widgitList.length}");
//     if (!isFrequencySelected) {
//       print('object');
//       addNewField();
//     }
//     isFrequencySelected = true;
//   }

//   addNewField() {
//     widgitList.add(
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tune",
//           "Promotional Pack and tune"
//         ],
//         title: "Service Type",
//         onChanged: (value) {},
//       ),
//     );

//     widgitList.add(ReusbaleDropDownButton(
//       items: [
//         "Promotional Pack",
//         "Promotional Tune",
//         "Promotional Pack and tune"
//       ],
//       title: "Offer",
//       onChanged: (value) {},
//     ));
//     widgitList.add(
//       ReusbaleDropDownButton(
//         items: [
//           "Promotional Pack",
//           "Promotional Tune",
//           "Promotional Pack and tune"
//         ],
//         title: "Tone",
//         onChanged: (value) {},
//       ),
//     );
//   }
// }

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
