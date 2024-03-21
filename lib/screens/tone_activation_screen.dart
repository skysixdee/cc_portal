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
