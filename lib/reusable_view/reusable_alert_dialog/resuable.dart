// import 'package:flutter/material.dart';
// import 'package:cc_portal/utilily/colors.dart';

// // class ReusableAlertDialogBox extends StatelessWidget {
// //   final String textLine1;
// //  // final String textLine2;
// //   final Function()? onYesPressed; // Callback function

// //   ReusableAlertDialogBox(
// //       {Key? key,
// //       required this.textLine1,
// //     //  required this.textLine2,
// //       this.onYesPressed})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Dialog(
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(5),
// //         side: BorderSide(color: Colors.grey, width: 1),
// //       ),
// //       child: Container(
// //         width: MediaQuery.of(context).size.width * 0.3,
// //         height: MediaQuery.of(context).size.height * 0.4,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.red,
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(5),
// //                   topRight: Radius.circular(5),
// //                 ),
// //               ),
// //               height: 60,
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 15),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'Alert',
// //                       style: TextStyle(
// //                         fontSize: 18.0,
// //                         fontWeight: FontWeight.w900,
// //                         color: Colors.white,
// //                       ),
// //                     ),
// //                     InkWell(
// //                       onTap: () {
// //                         Navigator.of(context).pop();
// //                       },
// //                       child: Icon(Icons.clear, color: Colors.white),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 30),
// //             Text(textLine1, style: TextStyle(fontSize: 16)),
// //            // Text(textLine2, style: TextStyle(fontSize: 16)),
// //             SizedBox(height: 30),
// //             Padding(
// //               padding: const EdgeInsets.only(right: 10),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.end,
// //                 children: [
// //                   InkWell(
// //                     onTap: () {
// //                       Navigator.of(context).pop();
// //                     },
// //                     child: Container(
// //                       height: 35,
// //                       width: 100,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(5),
// //                         border: Border.all(color: Colors.grey, width: 1),
// //                         color: Colors.grey[200],
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           "No",
// //                           style: TextStyle(fontWeight: FontWeight.w300),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     width: 25,
// //                   ),
// //                   InkWell(
// //                     onTap: onYesPressed, // Calling the callback function
// //                     child: Container(
// //                       height: 35,
// //                       width: 100,
// //                       decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(5),
// //                         color: Colors.red,
// //                       ),
// //                       child: Center(
// //                         child: Text(
// //                           "Yes",
// //                           style: TextStyle(
// //                             color: Colors.grey[50],
// //                             fontWeight: FontWeight.w900,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class ReusableAlertDialogBox extends StatelessWidget {
//   final String textLine1;
//   final Function(BuildContext)? onYesPressed;
//   bool isLoading = false;

//   ReusableAlertDialogBox({
//     Key? key,
//     required this.textLine1,
//     this.onYesPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//         side: BorderSide(color: Colors.grey, width: 1),
//       ),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.3,
//         height: MediaQuery.of(context).size.height * 0.4,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: sixdColor,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(5),
//                   topRight: Radius.circular(5),
//                 ),
//               ),
//               height: 60,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Alert',
//                       style: TextStyle(
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w900,
//                         color: Colors.white,
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Icon(Icons.clear, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Text(textLine1, style: TextStyle(fontSize: 16)),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.only(right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Container(
//                       height: 35,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: Colors.grey, width: 1),
//                         color: Colors.grey[200],
//                       ),
//                       child: Center(
//                         child: Text(
//                           "No",
//                           style: TextStyle(fontWeight: FontWeight.w300),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 25),
//                   InkWell(
//                     onTap: () {
//                       if (onYesPressed != null) {
//                         onYesPressed!(context);
//                       }
//                     },
//                     child: Container(
//                       height: 35,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: sixdColor,
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Yes",
//                           style: TextStyle(
//                             color: Colors.grey[50],
//                             fontWeight: FontWeight.w900,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
