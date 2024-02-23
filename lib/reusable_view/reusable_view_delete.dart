import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool addDropDown;
  final bool isTextView;
  final bool crossButton;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.title,
    this.addDropDown = false,
    this.isTextView = false,
    this.crossButton = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool enableClearBtn = false;
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class TextFieldView extends StatelessWidget {

  final TextEditingController textFieldController = TextEditingController();
  final CrossButtonController myController = Get.put(CrossButtonController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
          width: 300,
          //color: Colors.blue,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                Container(
                  height: widget.isTextView ? null : 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: widget.isTextView ? double.minPositive : 55,
                          color: Colors.red,
                          width: 3),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextField(
                            maxLines: widget.isTextView ? null : 1,
                            controller: textFieldController,
                            onChanged: (text) {
                              setState(() {
                                print("On Change ${textFieldController.text}");
                                enableClearBtn =
                                    textFieldController.text.isNotEmpty
                                        ? true
                                        : false;
                              });
                              myController.onTextChanged(text);
                            },
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: widget.hintText,
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 196, 193, 193),
                              ),
                              border: InputBorder.none,
                              suffixIcon: enableClearBtn
                                  ? clearButtonWidget()
                                  : SizedBox(),
                            ),
                          ),
                        ),
                      ),
                      widget.addDropDown ? dropDownWidget() : SizedBox(),
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
        setState(() {
          enableClearBtn = textFieldController.text.isNotEmpty;
        });
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
