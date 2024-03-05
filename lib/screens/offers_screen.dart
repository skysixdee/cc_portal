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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Container(
                color: greyLight,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suspend and resume',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    SearchNumberView(
                      title: 'MSISDN',
                      hintText: 'Enter MSISDN',
                      onSearchTap: (p0) {},
                    ),
                  ],
                ),
              ),
            ),
          ),SizedBox(height: 10),
          Container(
            color: Colors.white, // You can change the color if needed
            child: Center(
              child: Container(
                color: greyLight,
                
                height: 200,
                width: 800,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   // Expanded(child: 
                   // SizedBox(width: 30),
                   
                    Expanded(
                      child: Container(
                        width:65,
                      height:20,
                      color:Colors.white),
                    ),

                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        width:65,
                      height:20,
                      color:Colors.white),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        width:50,
                      height:20,
                      color:Colors.white),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        width:50,
                      height:20,
                      color:Colors.white),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        width:50,
                      height:20,
                      color:Colors.white),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        width:50,
                      height:20,
                      color:Colors.white),
                    ),
                    
                    // Add your content for the second container here
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
