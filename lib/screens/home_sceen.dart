import 'package:flutter/material.dart';

import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Column(
          children: [
            TextFieldView( 
              title: 'Pack Name',
              hintText:'Enter Pack Name',
              crossButton: true,
              ),
            TextFieldView(
              title: 'RBT Type',
              hintText:'Enter RBT Type',
              addDropDown: true,  
              crossButton: true,
            ),
            TextFieldView(
              title: 'PACK Description',
              hintText:'Enter Pack Description',
              isTextView: true,
              crossButton: true,
            )



          ],),)
    );
  }
}
