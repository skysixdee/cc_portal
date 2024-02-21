import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class delete_view extends StatelessWidget {
  final String title;
  final bool addDropDown;
  const delete_view({super.key, required this.title, this.addDropDown = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Container(
              height: 35,
              color: redColor,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: sixdColor,
                    ),
                  ),
                  addDropDown ? Icon(Icons.arrow_drop_down) : Icon(Icons.close)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
