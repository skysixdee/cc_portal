import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suspend and resume',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          ReusableTextField(
            title: 'Msisdn',
            hintText: 'Enter text',
          ),
        ],
      ),
    );
  }
}

class ReusableTextField extends StatefulWidget {
  final String title;
  final String hintText;

  ReusableTextField({
    Key? key,
    required this.hintText,
    required this.title,
  }) : super(key: key);

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
  bool enableClearBtn = false;
  final TextEditingController textFieldController = TextEditingController();
  //final CrossButtonController myController = Get.put(CrossButtonController());
  String errorMessage = '';

 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Text(widget.title),
            Container(
              height: 30,
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
                    width: 3,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
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
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: widget.hintText,
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 196, 193, 193),
                          ),
                          border: InputBorder.none,
                          suffixIcon: enableClearBtn ? clearButtonWidget() : SizedBox(),
                        ),
                      ),
                    ),
                  ),//Column(children: [Text('gdh')],)
                //Row(children: [Text('data')],)
                ],
              ),
            ),//Column(children: [Text('hhh')],),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onSearchPressed();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      
                      color: Colors.blue,
                      
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    onResetPressed();
                  },
                  child: Container(//height: 30,//width: 80,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      
                      border: Border.all(color: Colors.grey),
                      
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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
