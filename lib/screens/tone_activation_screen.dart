import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_modal.dart';

import 'package:sm_admin_portal/controllers/tone_active_controller.dart';
import 'package:sm_admin_portal/network_manager/network_manager.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/utilily/urls.dart';

class ToneActivationScreen extends StatefulWidget {
  ToneActivationScreen({Key? key}) : super(key: key);

  @override
  State<ToneActivationScreen> createState() => _ToneActivationScreenState();
}

class _ToneActivationScreenState extends State<ToneActivationScreen> {
  ToneActiveController con = Get.put(ToneActiveController());
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
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
                                crossAxisSpacing: 20,
                              ),
                              itemBuilder: (context, index) {
                                return con.widgitList[index];
                              },
                            );
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isLoading = true;
                              });
                              _submitData().then((response) {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            },
                            child: Container(
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
          if (_isLoading) loadingIndicatorView(),
        ],
      ),
    );
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

  Future<GenericModal> _submitData() async {
    setState(() {
      _isLoading = true;
    });
    String url =
        'http://10.0.10.33:5678/selfcare/subscriber-management/buy-tone';

    Map<String, dynamic> jsondata = {
      "transactionId": "5234908485",
      "featureId": 1,
      "msisdn": "92000001",
      "offerCode": "CRBT_MONTHLY_REC",
      "contentId": "1157835",
      "contentType": 1,
      "languageCode": "en",
      "channelId": 2,
      "userData": "some data"
    };

    Map<String, dynamic> jsonrequ =
        await NetworkManager().postResquest(url, jsondata);

    GenericModal modal = GenericModal.fromJson(jsonrequ);

    setState(() {
      _isLoading = false;
    });

    return modal;
  }
}
