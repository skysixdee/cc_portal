import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/reusable_view/custom_text_field.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/sky_dashboard_view.dart';

class BulkScreen extends StatelessWidget {
  const BulkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: SkyDashboardView(),
    ) //bulkBuilder(context),
        );
  }

  Scaffold bulkBuilder(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: boxShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 700),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusbaleDropDownButton(
                      items: ["ACTIVATION", "DEACTIVATION"],
                      title: "Operation Name",
                      onChanged: (value) {
                        // if (value == "ACTIVATION") {
                        // Add your action here when "ACTIVATION" is selected
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: InkWell(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                          type: FileType.custom,
                                          allowedExtensions: ['csv', 'xlsv']);
                                  if (result != null) {
                                    final file = result.files.first;
                                    print('selected file: ${file.name!}');
                                  }
                                },
                                child: Container(
                                  height: 300,
                                  width: 600,
                                  color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Bulk Upload',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w100,
                                                fontSize: 15,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Icon(Icons.clear),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 380.0),
                                        child: Column(
                                          children: [Text('*Mandatory')],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 80,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                            //width: 100,
                                            // child: ElevatedButton(
                                            //   onPressed: () {},
                                            child: Text(
                                              'Select file',
                                              style: TextStyle(
                                                  color: Colors.white),
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Upload',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'Drag and Drop your file here or Browse to upload',
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: RichText(
                                          text: TextSpan(
                                            text:
                                                'Supported Files and Sizes are ',
                                            style: TextStyle(fontSize: 10),
                                            children: const <TextSpan>[
                                              TextSpan(
                                                  text: 'Csv and Excel',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10)),
                                              TextSpan(
                                                  text:
                                                      ' maximum number o records is 50000 with max size of',
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                              TextSpan(
                                                  text: ' 50 MB',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10)),
                                            ],
                                          ),
                                        ),
                                        // child: RichText(
                                        //   text: TextSpan(
                                        //     text:
                                        //         'Supported Files and Sizes are Csv and Excel maximum number o records is 50000 with max size of 50MB',
                                        //     style: TextStyle(
                                        //       fontSize: 10,
                                        //       color: Colors.black,
                                        //     ),
                                        //   ),
                                        //   maxLines: 1,
                                        // ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        height: 1,
                                        color: Colors.black12,
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            // child:
                                            // TextButton(
                                            //   onPressed: () {
                                            //     Navigator.of(context).pop();
                                            //   },
                                            child: Text(
                                              'cancel',
                                              style: TextStyle(
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: Container(
                                              width: 60,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.blue),
                                              child:
                                                  // ElevatedButton(
                                                  //   onPressed: () {},
                                                  //   child:
                                                  Center(
                                                child: Text(
                                                  'Upload',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                            });
                      },
                      direction: PopoverDirection.bottom,
                      hintText: '',
                    )
                  ],
                ),
              ),
            )));
  }
}
