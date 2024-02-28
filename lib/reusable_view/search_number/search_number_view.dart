import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchNumberView extends StatefulWidget {
  final String title;
  final String hintText;

  SearchNumberView({
    Key? key,
    required this.hintText,
    required this.title,
  }) : super(key: key);

  @override
  State<SearchNumberView> createState() => _SearchNumberViewState();
}

class _SearchNumberViewState extends State<SearchNumberView> {
  bool enableClearBtn = false;
  final TextEditingController textFieldController = TextEditingController();
  //final CrossButtonController myController = Get.put(CrossButtonController());
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 43,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 45,
                          color: Colors.red,
                          width: 2,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 3),
                            child: textField(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                buttonsContainer(),
              ],
            ), //Column(children: [Text('hhh')],),
            errorMessageWidget(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  TextField textField() {
    return TextField(
      maxLines: 1,
      controller: textFieldController,
      onChanged: (text) {
        setState(() {
          enableClearBtn = textFieldController.text.isNotEmpty;
          errorMessage = RegExp(r'^[0-9]+$').hasMatch(text)
              ? ''
              : 'Invalid input. Only numbers are allowed.';
        });
        //myController.onTextChanged(text);
      },
      decoration: textFieldInputDecoration(),
    );
  }

  SingleChildRenderObjectWidget errorMessageWidget() {
    return errorMessage.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )
        : SizedBox(height: 6);
  }

  InputDecoration textFieldInputDecoration() {
    return InputDecoration(
      isDense: true,
      hintText: widget.hintText,
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 196, 193, 193),
      ),
      border: InputBorder.none,
      suffixIcon: enableClearBtn ? clearButtonWidget() : SizedBox(),
    );
  }

  Row buttonsContainer() {
    return Row(
      children: [
        searchButtonWidget(),
        SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            onResetPressed();
          },
          child: resetButtonWidget(),
        ),
      ],
    );
  }

  Container resetButtonWidget() {
    return Container(
      height: 42,
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          resetStr,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  GestureDetector searchButtonWidget() {
    return GestureDetector(
      onTap: () {
        onSearchPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        height: 42,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
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
          errorMessage = '';
        });
      },
    );
  }

  void onSearchPressed() {
    String input = textFieldController.text;
    if (RegExp(r'^[0-9]+$').hasMatch(input)) {
      print('Search successful');
    } else {
      setState(() {
        errorMessage = 'Invalid input. Only numbers are allowed.';
      });
    }
  }

  void onResetPressed() {
    textFieldController.clear();
    setState(() {
      enableClearBtn = textFieldController.text.isNotEmpty;
      errorMessage = '';
    });
  }
}
