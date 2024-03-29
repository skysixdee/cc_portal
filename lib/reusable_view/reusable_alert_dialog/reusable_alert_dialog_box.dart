import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/api_calls/copy_tone_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';



class ReusableAlertDialog extends StatelessWidget {
  final String textLine1;
  final String textLine2;
  final Function()? onYesPressed; // Callback function

  ReusableAlertDialog({Key? key, required this.textLine1, required this.textLine2, this.onYesPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Colors.grey, width: 1),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alert',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.clear, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(textLine1, style: TextStyle(fontSize: 16)),
            Text(textLine2, style: TextStyle(fontSize: 16)),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width:25,
                  ),
                  InkWell(
                    onTap: onYesPressed, // Calling the callback function
                    child: Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: Colors.grey[50],
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}










// class ReusableAlertDialog extends StatefulWidget {
  
//   final String textLine1;
//   final String textLine2;

  
//    ReusableAlertDialog({super.key, required this.textLine1, required this.textLine2});
//   @override
//   State<ReusableAlertDialog> createState() => _ReusableAlertDialogState();
// }

// class _ReusableAlertDialogState extends State<ReusableAlertDialog> {
//   final TextEditingController textFieldController = TextEditingController();
//   final CrossButtonController myController = Get.put(CrossButtonController());
//   bool enableClearBtn = false;
  
//   // bool _removeRow = false;
//   // bool get removeRow => _removeRow;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       //backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//           side: BorderSide(color: Colors.grey, width: 1)),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.3,
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             //mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 decoration:BoxDecoration(
//                    color: Colors.red,
//           borderRadius: BorderRadius.only(
//             topLeft:Radius.circular(5),
//             topRight: Radius.circular(5),
           
//           ),
//         ),
//                 height: 60,
//                 //width: 500,
                
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     right:15,
//                     left:15,
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Alert',
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w900,
//                             color:Colors.white,
//                           ),
//                         ),
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Icon(
//                               Icons.clear,
//                               color:Colors.white)
//                         ),
//                       ]),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 widget.textLine1,
//                 style:TextStyle(
//                   fontSize: 16,
//                 )),
//               Text(
//                 widget.textLine2,
//                 style:TextStyle(
//                   fontSize: 16,
//                 )),
//               SizedBox(height:10),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right:10,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                             height: 35,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border:Border.all(
//                                 color:Colors.grey,
//                                 width:1,
//                               ),
//                               color: Colors.grey[200],
                
//                             ),
//                             child: Center(
//                               child: Text("No",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w300)
//                                     ),
//                             ))),
//                     InkWell(
//                         onTap: () {
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             left:25,
//                           ),
//                           child: Container(
//                               height: 35,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.red),
//                               child: Center(
//                                 child: Text("Yes",
//                                     style: TextStyle(
//                                         color: Colors.grey[50],
//                                         fontWeight: FontWeight.w900)
//                                  ),
//                               )),
//                         ))
//                   ],
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }




// class ReusableAlertDialog extends StatefulWidget {
  
//   final String textLine1;
//   final String textLine2;
//   bool removeRow;
  
//    ReusableAlertDialog({super.key, required this.textLine1, required this.textLine2, this.removeRow=false});
//   @override
//   State<ReusableAlertDialog> createState() => _ReusableAlertDialogState();
// }

// class _ReusableAlertDialogState extends State<ReusableAlertDialog> {
//   final TextEditingController textFieldController = TextEditingController();
//   final CrossButtonController myController = Get.put(CrossButtonController());
//   bool enableClearBtn = false;
  
//   // bool _removeRow = false;
//   // bool get removeRow => _removeRow;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       //backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(5),
//           side: BorderSide(color: Colors.grey, width: 1)),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.3,
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             //mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 decoration:BoxDecoration(
//                    color: Colors.red,
//           borderRadius: BorderRadius.only(
//             topLeft:Radius.circular(5),
//             topRight: Radius.circular(5),
           
//           ),
//         ),
//                 height: 60,
//                 //width: 500,
                
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     right:15,
//                     left:15,
//                   ),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Alert',
//                           style: TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w900,
//                             color:Colors.white,
//                           ),
//                         ),
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Icon(
//                               Icons.clear,
//                               color:Colors.white)
//                         ),
//                       ]),
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 widget.textLine1,
//                 style:TextStyle(
//                   fontSize: 16,
//                 )),
//               Text(
//                 widget.textLine2,
//                 style:TextStyle(
//                   fontSize: 16,
//                 )),
//               SizedBox(height:10),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   right:10,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                             height: 35,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               border:Border.all(
//                                 color:Colors.grey,
//                                 width:1,
//                               ),
//                               color: Colors.grey[200],
                
//                             ),
//                             child: Center(
//                               child: Text("No",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w300)
//                                     ),
//                             ))),
//                     InkWell(
//                         onTap: () {

//                             widget.removeRow=true;
                            
//                           //getCopyToneDetailApi();
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                             left:25,
//                           ),
//                           child: Container(
//                               height: 35,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.red),
//                               child: Center(
//                                 child: Text("Yes",
//                                     style: TextStyle(
//                                         color: Colors.grey[50],
//                                         fontWeight: FontWeight.w900)
//                                  ),
//                               )),
//                         ))
//                   ],
//                 ),
//               ),
//             ]),
//       ),
//     );
//   }
// }






// class ReusableAlertDialog extends StatefulWidget {
//   final String text1;
//   final String text2;

//   const ReusableAlertDialog({super.key, required this.text1, required this.text2});
//   @override
//   State<ReusableAlertDialog> createState() => _ReusableAlertDialogState();
// }

// class _ReusableAlertDialogState extends State<ReusableAlertDialog> {
//   final TextEditingController textFieldController = TextEditingController();
//   final CrossButtonController myController = Get.put(CrossButtonController());
//   bool enableClearBtn = false;
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         //borderRadius: BorderRadius.circular(5),
//         side: BorderSide(color: Colors.grey, width: 1),
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.3,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 60,
//               color: Colors.red,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Alert',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w900,
//                       color: Colors.white,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Icon(Icons.clear, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Your first text here',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Your second text here',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop(); // Close dialog
//                           },
//                           child: Text("No"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Yes action
//                           },
//                           child: Text("Yes"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//         side: BorderSide(color: Colors.grey, width: 1),
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.3,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 60,
//               color: Colors.red,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Alert',
//                     style: TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w900,
//                       color: Colors.white,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Icon(Icons.clear, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Your first text here',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 10),
//                     Text(
//                       'Your second text here',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     Spacer(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop(); // Close dialog
//                           },
//                           child: Text("No"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             // Yes action
//                           },
//                           child: Text("Yes"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
// );




