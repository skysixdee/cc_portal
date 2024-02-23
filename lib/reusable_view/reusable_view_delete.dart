import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';

class TextFieldView extends StatelessWidget {
  final String title;
  final String hintText;
  final bool addDropDown;
  final bool isTextView;
  final bool crossButton;
  TextFieldView({
    super.key,
    required this.hintText,
    required this.title,
    this.addDropDown = false,
    this.isTextView = false,
    this.crossButton = false,
  });

  final TextEditingController textFieldController = TextEditingController();
  final CrossButtonController myController = Get.put(CrossButtonController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
          height: 150,
          width: 300,
          //color: Colors.blue,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Container(
                  height: isTextView ? null : 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Container(
                          height: isTextView ? double.minPositive : 55,
                          color: Colors.red,
                          width: 3),
                      Expanded(
                        child: TextField(
                          maxLines: isTextView ? null : 1,
                          controller: textFieldController,
                          onChanged: (text){
                            myController.onTextChanged(text);
                          },
                          decoration: InputDecoration(
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 193, 193),
                            ),
                            border: InputBorder.none,
                            suffixIcon: clearButtonWidget(),
                          ),
                        ),
                      ),
                      addDropDown ?  dropDownWidget() : SizedBox(),
                    ],
                  ),
                )
              ])),
    );
  }

  IconButton clearButtonWidget() {
    return IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        textFieldController.clear();
      },
      );
  }

  IconButton dropDownWidget() {
    return IconButton(
      onPressed: () {
        print('Dropdown button pressed');
      },
      icon: Icon(Icons.arrow_drop_down));
  }
}
















/*import 'package:flutter/material.dart';
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
} */
