import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

// void main() {
//   runApp(MessageTemplateApp());
// }

// class MessageTemplateApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MessageTemplateScreen(),
//     );
//   }
// }

// class MessageTemplateScreen extends StatefulWidget {
//   MessageTemplateScreen({Key? key});

//   @override
//   State<MessageTemplateScreen> createState() => _MessageTemplateScreenState();
// }

// class _MessageTemplateScreenState extends State<MessageTemplateScreen> {
//   bool enableClearBtn = false;
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
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 5),
//                   child: Container(
//                     height: 300,
//                     width: 400,
//                     decoration: BoxDecoration(
//                       border: Border(top: BorderSide(color: Colors.white)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 5,
//                           spreadRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Category'),
//                         ReusableTextFieldContainer(
//                           controller: textFieldController,
//                           onChanged: (text) {
//                             setState(() {
//                               enableClearBtn = text.isNotEmpty;
//                             });
//                           },
//                           hintText: 'Artist',
//                           enableClearBtn: enableClearBtn,
//                           onClearPressed: () {
//                             textFieldController.clear();
//                             setState(() {
//                               enableClearBtn = false;
//                             });
//                           },
//                           dropdownOptions: dropdownOptions,
//                           selectedOption: selectedDropdownOption,
//                           onOptionSelected: (option) {
//                             setState(() {
//                               selectedDropdownOption = option;
//                               textFieldController.text = option;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ReusableTextFieldContainer extends StatefulWidget {
//   final TextEditingController controller;
//   final ValueChanged<String>? onChanged;
//   final String hintText;
//   final bool enableClearBtn;
//   final VoidCallback? onClearPressed;
//   final List<String> dropdownOptions;
//   final String selectedOption;
//   final ValueChanged<String> onOptionSelected;

//   ReusableTextFieldContainer({
//     required this.controller,
//     this.onChanged,
//     required this.hintText,
//     required this.enableClearBtn,
//     this.onClearPressed,
//     required this.dropdownOptions,
//     required this.selectedOption,
//     required this.onOptionSelected,
//   });

//   @override
//   _ReusableTextFieldContainerState createState() =>
//       _ReusableTextFieldContainerState();
// }

// class _ReusableTextFieldContainerState
//     extends State<ReusableTextFieldContainer> {
//   bool isDropdownOpen = false;
//   String hoveredOption = "";

//   void showDropdownMenu(BuildContext context) async {
//     final RenderBox overlay =
//         Overlay.of(context)!.context.findRenderObject() as RenderBox;

//     await showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//         Rect.fromPoints(
//           overlay.localToGlobal(Offset.zero),
//           overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
//         ),
//         Offset.zero & overlay.size,
//       ),
//       items: widget.dropdownOptions.map((option) {
//         return PopupMenuItem<String>(
//           value: option,
//           child: InkWell(
//             onTap: () {
//               setState(() {
//                 widget.onOptionSelected(option);
//                 isDropdownOpen = false;
//               });
//               Navigator.pop(context);
//             },
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: option == hoveredOption ? Colors.blue : Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(option),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey, width: 1),
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 8),
//                   child: TextField(
//                     maxLines: 1,
//                     controller: widget.controller,
//                     onChanged: widget.onChanged,
//                     decoration: InputDecoration(
//                       isDense: true,
//                       hintText: widget.hintText,
//                       hintStyle: TextStyle(
//                         color: Color.fromARGB(255, 196, 193, 193),
//                       ),
//                       border: InputBorder.none,
//                       suffixIcon: widget.enableClearBtn
//                           ? IconButton(
//                               icon: Icon(Icons.clear),
//                               onPressed: widget.onClearPressed,
//                             )
//                           : SizedBox(),
//                     ),
//                   ),
//                 ),
//               ),
//               ResponsiveBuilder(
//                 builder: (context, sizingInformation) {
//                   return InkWell(
//                     onTap: () {
//                       showDropdownMenu(context);
//                       showPopover(
//                         context: context,
//                         bodyBuilder: (context) => DropdownMenuItem(
//                           child: Container(),
//                         ),
//                       );
//                     },
//                     child: Icon(Icons.arrow_drop_down),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         if (isDropdownOpen)
//           Container(
//             width: double.infinity,
//             margin: EdgeInsets.only(top: 8),
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(255, 177, 176, 176).withOpacity(0.5),
//                   spreadRadius: 5,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: widget.dropdownOptions
//                   .map((option) => MouseRegion(
//                         onEnter: (_) {
//                           setState(() {
//                             hoveredOption = option;
//                           });
//                         },
//                         onExit: (_) {
//                           setState(() {
//                             hoveredOption = "";
//                           });
//                         },
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               widget.onOptionSelected(option);
//                               isDropdownOpen = false;
//                             });
//                           },
//                           // child: Container(
//                           //   width: double.infinity,
//                           //   decoration: BoxDecoration(
//                           //     color: option == hoveredOption
//                           //         ? Colors.blue
//                           //         : Colors.white,
//                           //   ),
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.all(8.0),
//                           //     child: Text(
//                           //       option,
//                           //     ),
//                           //   ),
//                           // ),
//                         ),
//                       ))
//                   .toList(),
//             ),
//           ),
//       ],
//     );
//   }
// }
