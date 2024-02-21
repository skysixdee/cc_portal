import 'package:flutter/material.dart';
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
              delete_view(title: "Pack name"),
              delete_view(
                title: "CRBT Type",
                addDropDown: true,
              ),
              delete_view(title: "PACK Description"),
              // Container(
              //   color: redColor,
              //   height: 200,
              //   width: 200,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
