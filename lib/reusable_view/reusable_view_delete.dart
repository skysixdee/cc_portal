import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';
//import 'popover_list.dart';

class ReusableTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final bool addDropDown;
  final bool isTextView;
  final bool crossButton;
  final bool isTextFieldEnabled;
  

  ReusableTextField({
    super.key,
    required this.hintText,
    this.title = '',
    this.addDropDown = false,
    this.isTextView = false,
    this.crossButton = false,
    this.isTextFieldEnabled=true,
  });

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool enableClearBtn = false;
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// class TextFieldView extends StatelessWidget {

  final TextEditingController textFieldController = TextEditingController();
  String _selectedOption = '';
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
                            enabled:widget.isTextFieldEnabled? null: addText(),
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
              ])
            ),
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

  Widget dropDownWidget() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return IconButton(
            onPressed: () {
              showPopover(
                context: context,
                bodyBuilder: (context) => ListItems(),
                direction: PopoverDirection.bottom,
                width: 200,
                height: 200,
                arrowHeight: 10,
                arrowWidth: 20,
              );
            },
            icon: Icon(Icons.arrow_drop_down));
      },
    );
  }

  ListItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              children: [
                InkWell(
                  onTap: () {
                    _updateTextField('Entry A');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(225, 190, 231, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry A',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry B');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(206, 147, 216, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry B',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry C');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(186, 104, 200, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry C',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry D');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(171, 71, 188, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry D',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry E');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(156, 39, 176, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry E',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry F');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(142, 36, 170, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry F',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    _updateTextField('Entry G');
                  },
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: const Color.fromRGBO(106, 27, 154, 1),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: const Center(
                        child: Text('Entry G',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateTextField(String selectedOption) {
    setState(() {
      _selectedOption = selectedOption;
      textFieldController.text = _selectedOption;
    });
  }
  
  addText() {
    textFieldController.text='7000000033';
    
  }
}
