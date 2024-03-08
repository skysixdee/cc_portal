// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:popover/popover.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';
// //final TextEditingController textFieldController = TextEditingController();

// class MessageTemplateScreen extends StatefulWidget {
//   MessageTemplateScreen({super.key});

//   @override
//   State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
// }

// class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
//   bool enableClearBtn = false;

//   final TextEditingController textFieldController = TextEditingController();

  

//   final CrossButtonController myController = Get.put(CrossButtonController());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
              
//               SizedBox(height: 20),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 5),
//                   child: Container(
//                       height: 300,
//                       width: 400,
//                       // padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         border: Border(top: BorderSide(color: Colors.white)),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 5,
//                             spreadRadius: 5,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                         color: Colors.white,
//                         //border: Border.all(color: Colors.black),
//                       ),
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('widget.title'),
//                             Container(
//                               //  height: widget.isTextView ? null : 45,
//                               decoration: BoxDecoration(
//                                   border:
//                                       Border.all(color: Colors.grey, width: 1),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   // Container(
//                                   //     //height: widget.isTextView ? double.minPositive : 55,
//                                   //     color: Colors.red,
//                                   //     width: 3),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 8),
//                                       child: TextField(
//                                         maxLines: 1,
//                                         controller: textFieldController,
//                                         onChanged: (text) {
//                                           setState(() {
//                                             print(
//                                                 "On Change ${textFieldController.text}");
//                                             enableClearBtn = textFieldController
//                                                     .text.isNotEmpty
//                                                 ? true
//                                                 : false;
//                                           });
//                                           myController.onTextChanged(text);
//                                         },
//                                         decoration: InputDecoration(
//                                           isDense: true,
//                                           hintText: 'hintText',
//                                           hintStyle: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 196, 193, 193),
//                                           ),
//                                           border: InputBorder.none,
//                                           suffixIcon: enableClearBtn
//                                               ? clearButtonWidget()
//                                               : SizedBox(),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(Icons.arrow_drop_down)

//                                 ],
//                               ),
//                             )
//                           ])),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   IconButton clearButtonWidget() {
//     return IconButton(
//       icon: Icon(Icons.clear),
//       onPressed: () {
//         textFieldController.clear();
//         setState(() {
//           enableClearBtn = textFieldController.text.isNotEmpty;
//         });
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// class MessageTemplateScreen extends StatefulWidget {
//   MessageTemplateScreen({Key? key}) : super(key: key);

//   @override
//   State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
// }

// class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
//   bool enableClearBtn = false;
//   bool isDropdownOpen = false;
//   String hoveredOption = "";

//   final TextEditingController textFieldController = TextEditingController();
//   List<String> dropdownOptions = ["Option 1", "Option 2", "Option 3"];
//   String selectedDropdownOption = "";

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.only(top: 5),
//                 child: Container(
//                   height: 500,
//                   width: 800,
//                   decoration: BoxDecoration(
//                     border: Border(top: BorderSide(color: Colors.white)),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 5,
//                         spreadRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Category'),SizedBox(height: 10),
//                       Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey, width: 1),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Container(width: 100,height: 50,
//                                 child: TextFormField(
//                                   maxLines: 1,
//                                   controller: textFieldController,
//                                   onChanged: (text) {
//                                     setState(() {
//                                       enableClearBtn =
//                                           textFieldController.text.isNotEmpty;
//                                     });
//                                   },
//                                   decoration: InputDecoration(
//                                     isDense: true,
//                                     hintText: 'Artist',
//                                     hintStyle: TextStyle(
//                                       color: Color.fromARGB(255, 196, 193, 193),
//                                     ),
//                                     border: InputBorder.none,
//                                     suffixIcon: enableClearBtn
//                                         ? clearButtonWidget()
//                                         : SizedBox(),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   isDropdownOpen = !isDropdownOpen;
//                                 });
//                               },
//                               child: Icon(Icons.arrow_drop_down),
//                             ),
//                           ],
//                         ),
//                       ),
//                       if (isDropdownOpen)
                      
              
              
//                         Container(width: 500,
//                          padding: EdgeInsets.all(8),
              
              
                        
                        
//                         decoration: BoxDecoration(boxShadow: [
//                             BoxShadow(
//                 color: Color.fromARGB(255, 177, 176, 176).withOpacity(0.5),
//                 spreadRadius: 15,
//                 blurRadius: 15,
//                 offset: Offset(0, 3)),],
              
                         
                    
              
              
//                   //  border:Border.all(color: Colors.black),
//                     color: Colors.white,
//                    // border:Border.all(color: Colors.black)
//                         ),
//                         // padding: EdgeInsets.all(8),
                        
//                           //padding: EdgeInsets.symmetric(),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: dropdownOptions
//                                 .map((option) => MouseRegion(
//                                       onEnter: (_) {
//                                         setState(() {
//                                           hoveredOption = option;
//                                         });
//                                       },
//                                       onExit: (_) {
//                                         setState(() {
//                                           hoveredOption = "";
//                                         });
//                                       },
//                                       child: InkWell(
//                                          onTap: () {
//                                           setState(() {
//                                             selectedDropdownOption = option;
//                                             textFieldController.text = option;
//                                             isDropdownOpen = false;
//                                           });
//                                         },
//                                         child:Container(
//                                           width:500,
              
//                                           decoration: BoxDecoration(
//                                             color:  option == hoveredOption
//                                                 ?Colors.blue
//                                                 : Colors.white,
              
//                                           ),
//                                           child:Text(
//                                           option,
//                                         ),
//                                       )
                                        
                                        
//                                       ),
//                                     ))
//                                 .toList(),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   IconButton clearButtonWidget() {
//     return IconButton(
//       icon: Icon(Icons.clear),
//       onPressed: () {
//         textFieldController.clear();
//         setState(() {
//           enableClearBtn = false;
//         });
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageTemplateScreen extends StatefulWidget {
  MessageTemplateScreen({super.key});

  @override
  State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
}

class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
  bool enableClearBtn = false;

  final TextEditingController textFieldController = TextEditingController();

  //final CrossButtonController myController = Get.put(CrossButtonController());

  List<String> dropdownOptions = ["Option 1", "Option 2", "Option 3"];
  String selectedDropdownOption = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    height: 300,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.white)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category'),
                        ReusableTextFieldContainer(
                          controller: textFieldController,
                          onChanged: (text) {
                            setState(() {
                              enableClearBtn = text.isNotEmpty;
                            });
                          //  myController.onTextChanged(text);
                          },
                          hintText: 'Artist',
                          enableClearBtn: enableClearBtn,
                          onClearPressed: () {
                            textFieldController.clear();
                            setState(() {
                              enableClearBtn = false;
                            });
                          },
                          dropdownOptions: dropdownOptions,
                          selectedOption: selectedDropdownOption,
                          onOptionSelected: (option) {
                            setState(() {
                              selectedDropdownOption = option;
                              textFieldController.text = option;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CrossButtonController extends GetxController {
//   void onTextChanged(String text) {
//     // Implement any logic related to text change
//   }
// }

class ReusableTextFieldContainer extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final bool enableClearBtn;
  final VoidCallback? onClearPressed;
  final List<String> dropdownOptions;
  final String selectedOption;
  final ValueChanged<String> onOptionSelected;

  ReusableTextFieldContainer({
    required this.controller,
    this.onChanged,
    required this.hintText,
    required this.enableClearBtn,
    this.onClearPressed,
    required this.dropdownOptions,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  _ReusableTextFieldContainerState createState() =>
      _ReusableTextFieldContainerState();
}

class _ReusableTextFieldContainerState
    extends State<ReusableTextFieldContainer> {
  bool isDropdownOpen = false;
  String hoveredOption = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    maxLines: 1,
                    controller: widget.controller,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 196, 193, 193),
                      ),
                      border: InputBorder.none,
                      suffixIcon: widget.enableClearBtn
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: widget.onClearPressed,
                            )
                          : SizedBox(),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isDropdownOpen = !isDropdownOpen;
                  });
                },
                child: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
        if (isDropdownOpen)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 177, 176, 176).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.dropdownOptions
                  .map((option) => MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            hoveredOption = option;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            hoveredOption = "";
                          });
                        },
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.onOptionSelected(option);
                              isDropdownOpen = false;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: option == hoveredOption
                                  ? Colors.blue
                                  : Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                option,
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
      ],
    );
  }
}