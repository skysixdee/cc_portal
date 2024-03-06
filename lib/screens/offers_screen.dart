import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/search_number/search_number_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: Container(
          color: Colors.white,
          child: Center(
            child: Container(
              color: greyLight,
              // decoration: BoxDecoration(boxShadow: [
              //   BoxShadow(
              //       color: Color.fromARGB(255, 177, 176, 176).withOpacity(0.5),
              //       spreadRadius: 15,
              //       blurRadius: 15,
              //       offset: Offset(0, 3))
              // ]),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suspend and resume',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  SearchNumberView(
                    title: 'MSISDN',
                    hintText: 'Enter MSISDN',
                    onSearchTap: (p0) {},
                  ),
                  
                  CupertinoActivityIndicator(),
                ],

      
              ),
            ),
          ),
        ],
      ),
    );
  }
}
