import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sm_admin_portal/controllers/dashboard_controller.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

Widget customerTextFieldBuilder(
    TextEditingController textController, DashboardController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      onSubmitted: (value) {
                        controller.handleSubmit(
                          textController.text,
                        );
                      },
                      controller: textController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLength: 10,
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: 'Enter mobile number of the subscriber',
                        hintStyle: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () => controller.handleSubmit(
                      textController.text,
                    ),
                    child: Container(
                      height: 50,
                      width: 120,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: sixdColor,
                      ),
                      child: Center(
                        child: SMText(
                          title: submitStr,
                          textColor: white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
