import 'package:flutter/material.dart';

import 'package:sm_admin_portal/reusable_view/custom_border_tab_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SubscriberDetailScreen extends StatelessWidget {
  SubscriberDetailScreen({super.key});
  Color borderColor = grey;

  double borderWidth = 2;
  double tabButtonHeight = 45;
  List<String> tabItems = [
    packDetailStr,
    toneDetailsStr,
    packDetailStr,
    toneDetailsStr,
    packDetailStr,
    toneDetailsStr
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dividerColor,
      child: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: tabButtonHeight,
                ),
                Container(
                  height: 50,
                  decoration: mainContainerDecoration(),
                ),
                Container(
                  height: 200,
                  color: Colors.red,
                  //
                )
              ],
            ),
            CustomBorderTabView(
              tabButtonHeight: tabButtonHeight,
              tabItems: tabItems,
              borderWidth: borderWidth,
              borderColor: borderColor,
              onTap: (index) {
                print("Index tapped");
                print("slected tab =${tabItems[index]}");
              },
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration mainContainerDecoration() {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          color: borderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}

/*
bool border=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: border?ButtonBorder():null,
                  child: TextButton(
                    child: Text(
                      'Pack Details',
                      style:GoogleFonts.inter(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      )
                    ),
                    onPressed:(){
                      border=true;
                      ButtonBorder();
                    }, 
                  ),
                ),
                TextButton(
                  style:TextButton.styleFrom(
                    shape:RoundedRectangleBorder(
                      //side:BorderSide(color:Colors.grey)
                    )
                  ),
                  child: Text(
                    'Tone Details',
                    style:GoogleFonts.inter(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    )
                  ),
                  onPressed:(){}, 
                ),
              ],),
              Container(
                height:1,
                color:Colors.grey,
              )
          ],
        ),
          
      ),
    );
  }

  BoxDecoration ButtonBorder() {
    return BoxDecoration(
                  border:Border(
                    top:BorderSide(color:Colors.grey),
                    left:BorderSide(color:Colors.grey),
                    right:BorderSide(color:Colors.grey),
                  ) );
  }

*/