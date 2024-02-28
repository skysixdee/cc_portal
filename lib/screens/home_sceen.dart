import 'package:flutter/material.dart';

import '../reusable_view/reusable_view_delete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          ReusableTextField(
            title: 'Pack Name',
            hintText: 'Enter Pack Name',
            crossButton: true,
          ),
          SizedBox(height: 20),
          ReusableTextField(
            title: 'PACK Description',
            hintText: 'Enter Pack Description',
            isTextView: true,
            crossButton: true,
          ),
          SizedBox(height: 20),
          ReusableTextField(
            title: 'RBT Type',
            hintText: 'Enter RBT Type',
            addDropDown: true,
            crossButton: true,
          ),
          
          
        ],
      ),
    ));
  }
}
