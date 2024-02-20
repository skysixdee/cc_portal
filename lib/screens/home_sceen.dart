import 'package:flutter/material.dart';
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
              Container(
                color: redColor,
                height: 200,
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
