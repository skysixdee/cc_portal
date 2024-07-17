import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/api_calls/delete_pack_api.dart';
import 'package:sm_admin_portal/api_calls/delete_tone_api.dart';
import 'package:sm_admin_portal/api_calls/list_settings_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';

import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/Tunelist_screen.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    final TextEditingController textController = TextEditingController();

    List<Map<String, dynamic>> subscriptionDetails = [
      {
        'subscription': 'Subscription:',
        'status': 'ACTIVE',
        'statusColor': Colors.green,
        'details': 'CRBT Daily – Rs 7/Day',
        'buttonText': 'Deactivate',
      },
      {
        'subscription': 'Temp Status:',
        'status': 'ACTIVE',
        'statusColor': Colors.green,
        'details': '',
        'buttonText': 'Suspend Service',
      },
      {
        'subscription': 'Last Renewed on',
        'status': '',
        'statusColor': null,
        'details': '6th June 2024',
        'buttonText': '',
      },
      {
        'subscription': 'Next Renewal Date',
        'status': '',
        'statusColor': null,
        'details': '7th June 2024',
        'buttonText': '',
      },
    ];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Padding(
              padding: const EdgeInsets.only(top: 200),
              child: CircularProgressIndicator(),
            );
          } else if (controller.isSubmitted.value) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, top: 20),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle,
                          color: sixdColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        '91+ ${controller.mobileNumber.value}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: subscriptionDetails.map((detail) {
                              return buildDetailColumn(
                                  context, detail, controller, index);
                            }).toList(),
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        //listSettingApi(); //phonenumber
                        // getToneDetailApi();
                        deleteToneApi();
                        //Get.to(() => TuneListScreen());
                        context.goNamed(tuneListRoute);
                      },
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF0A487B), width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Tune List'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF0A487B), width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Activate New Tone'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 180,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF0A487B), width: 1.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Transaction History'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 600,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Container(
                            width: 300,
                            child: TextField(
                              controller: textController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              maxLength: 10,
                              decoration: InputDecoration(
                                counterText: '',
                                hintText:
                                    'Enter mobile number of the subscriber',
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 150),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () => controller.handleSubmit(
                              textController.text,
                            ),
                            child: Container(
                              height: 50,
                              width: 120,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: sixdColor,
                              ),
                              child: Center(
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  Widget buildDetailColumn(BuildContext context, Map<String, dynamic> detail,
      DashboardController controller, int index) {
    return Row(
      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(),
                children: [
                  TextSpan(
                    text: detail['subscription'],
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: detail['status'],
                    style: TextStyle(
                      color: detail['statusColor'],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3),
            if (detail['details'] != '') Text(detail['details']) else Text(" "),
            SizedBox(height: 3),
            if (detail['buttonText'] == 'Suspend Service')
              GestureDetector(
                onTap: () {
                  controller.isSubmitted.value = false;
                  detail['status'] = 'SUSPEND';
                  detail['buttonText'] = 'Resume Service';
                  detail['statusColor'] = Colors.red;
                  controller.isSubmitted.value = true;
                },
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(detail['buttonText'])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, bottom: 50),
                      child: IconButton(
                        icon: Icon(Icons.info_outline, color: Colors.black),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Info'),
                                content: Text('information'),
                                actions: [
                                  TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (detail['buttonText'] == 'Resume Service')
              GestureDetector(
                onTap: () {
                  controller.isSubmitted.value = false;
                  detail['status'] = 'ACTIVE';
                  detail['buttonText'] = 'Suspend Service';
                  detail['statusColor'] = Colors.green;
                  controller.isSubmitted.value = true;
                },
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(detail['buttonText'])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0, bottom: 50),
                      child: IconButton(
                        icon: Icon(Icons.info_outline, color: Colors.black),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Info'),
                                content: Text('information'),
                                actions: [
                                  TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (detail['buttonText'] == 'Deactivate')
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(detail['buttonText'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1.0, bottom: 50),
                    child: IconButton(
                      icon: Icon(Icons.info_outline, color: Colors.black),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Info'),
                              content: Text('hshsjwb'),
                              actions: [
                                TextButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
        if (detail['subscription'] != 'Next Renewal Date') SizedBox(width: 50),
        if (detail['subscription'] != 'Next Renewal Date')
          Container(
            height: 80,
            width: 1,
            color: Colors.black,
          ),
      ],
    );
  }
}
