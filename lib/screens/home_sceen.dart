import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/custom_text_field.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: black12,
      child: Row(
        children: [
          Column(
            children: [
              const SizedBox(height: 30),
              const Center(child: CustomTextField(addDropDown: true)),
              const Center(
                  child: CustomTextField(
                addDropDown: false,
              )),
              Center(
                  child: CustomTextField(
                addDropDown: true,
                isTextView: true,
                onDropDownTap: (value) {
                  print("Out side of class $value");
                },
              )),
            ],
          ),
        ],
      ),
    );
  }
}
