import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/router/router_name.dart';

import '../reusable_view/reusable_view_delete.dart';

/*class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          TextButton(onPressed: (){
            context.go(firstScreenRoute);
          }, child: Text("Go First screen")),
          CustomTextField(
            title: 'Pack Name',
            hintText: 'Enter Pack Name',
            crossButton: true,
          ),
          SizedBox(height: 20),
          CustomTextField(
            title: 'RBT Type',
            hintText: 'Enter RBT Type',
            addDropDown: true,
            crossButton: true,
          ),
          SizedBox(height: 20),
          CustomTextField(
            title: 'PACK Description',
            hintText: 'Enter Pack Description',
            isTextView: true,
            crossButton: true,
          )
        ],
      ),
    ));
  }
}*/

class ArrowBox extends StatelessWidget {
  final String text;
  final String arrowBoxImage = 'assets/pngs/page_indicator.png';
  final int number;

  ArrowBox({required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.only(right: 1),
        child: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          arrowBoxImage,
          height: 100,
          width: 100,
        ),
        //SizedBox(width: 0),
        Positioned(
          left: 8,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  // backgroundColor: Color.fromRGBO(182, 155, 155, 1),

                  radius: 9,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        '$number',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
        //Icon(Icons.circle,color: Colors.white,),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
        //SizedBox(
        //width: 0,
        // )
      ],
    ));
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> texts = ['Item 1', 'Item 2', 'Item 3', 'nnnx'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: texts.asMap().entries.map((entry) {
          return Container(
             // margin: EdgeInsets.only(right: 0),
              child: ArrowBox(text: entry.value, number: entry.key + 1));
        }).toList(),
      ),
    );
  }
}
