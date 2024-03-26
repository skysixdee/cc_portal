import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/subscribers_modal.dart';
import 'package:sm_admin_portal/api_calls/copy_tone_api.dart';
import 'package:sm_admin_portal/api_calls/pack_detail_api.dart';
import 'package:sm_admin_portal/api_calls/tone_detail_api.dart';
import 'package:sm_admin_portal/reusable_view/cross_button_controller.dart';
import 'package:sm_admin_portal/reusable_view/reusable_view_delete.dart';

class CustomAlertDialog extends StatefulWidget {
  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final TextEditingController textFieldController = TextEditingController();
  final CrossButtonController myController = Get.put(CrossButtonController());
  bool enableClearBtn = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //  backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.grey, width: 1)),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Copy Tone',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.clear))
              ]),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 8),
              Row(children: [
                ReusableTextField(
                  title: 'Friends MSISDN',
                  hintText: 'Enter MSISDN',
                  crossButton: true,
                  isTextFieldEnabled: false,
                ),

                //   Column(
                // //mainAxisAlignment: MainAxisAlignment.start,
                // //crossAxisAlignment: CrossAxisAlignment.start,
                // children: [
                //   Text('Friends MSISDN'),
                //   Container(
                //     height: 45,
                //     decoration: BoxDecoration(
                //         border: Border.all(color: Colors.grey, width: 1),
                //         borderRadius: BorderRadius.circular(5)
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Container(
                //             height: 45,
                //             color: Colors.red,
                //             width: 3),
                //         Expanded(
                //           child: Padding(
                //             padding: const EdgeInsets.only(left: 8),
                //             child: TextField(
                //              // maxLines: 1,
                //               controller: textFieldController,
                //               onChanged: (text) {
                //                 setState(() {
                //                   print("On Change ${textFieldController.text}");
                //                   enableClearBtn =
                //                       textFieldController.text.isNotEmpty
                //                           ? true
                //                           : false;
                //                 });
                //                 myController.onTextChanged(text);
                //               },
                //               decoration: InputDecoration(
                //                 isDense: true,
                //                 hintText: 'Enter MSISDN',
                //                 hintStyle: TextStyle(
                //                   color: Color.fromARGB(255, 196, 193, 193),
                //                 ),
                //                 border: InputBorder.none,
                //                 suffixIcon: clearButtonWidget(),
                //               ),
                //             ),
                //           ),
                //         ),
                //         //widget.addDropDown ? dropDownWidget() : SizedBox(),
                //       ],
                //     ),
                //   )
                // ]),

                ReusableTextField(
                  title: 'Subscriber MSISDN',
                  hintText: 'Subscriber MSISDN',
                  crossButton: true,
                ),
              ]),
              SizedBox(height: 40),
              Divider(),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Center(
                            child: Text("cancel",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w900)),
                          ))),
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pop();

                      //getCopyToneDetailApi();
                    },
                    child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue),
                        child: Center(
                          child: Text(
                            "Copy Tone",
                            style: TextStyle(
                                color: Colors.grey[50],
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  )
                ],
              ),
            ]),
      ),
    );
  }

  // Center loadingIndicatorView() {
  //   return Center(
  //       child: Padding(
  //     padding: const EdgeInsets.only(
  //       top: 50,
  //     ),
  //     child: Container(
  //         decoration: BoxDecoration(
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey,
  //               blurRadius: 4,
  //               offset: Offset(2, 2),
  //             )
  //           ],
  //           border: Border.all(
  //             color: Color.fromARGB(255, 220, 218, 218),
  //           ),
  //           borderRadius: BorderRadius.circular(10),
  //           color: Colors.white,
  //         ),
  //         height: 100,
  //         width: 300,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Container(
  //                 width: 20,
  //                 height: 20,
  //                 child: CircularProgressIndicator(
  //                   strokeWidth: 3,
  //                   color: Colors.blue,
  //                 )),
  //             Text('Loading, please wait...',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w600,
  //                 )),
  //           ],
  //         )),
  //   ));
  // }

  // IconButton clearButtonWidget() {
  //   return IconButton(
  //     icon: Icon(Icons.clear),
  //     onPressed: () {
  //       textFieldController.clear();
  //       setState(() {
  //         enableClearBtn = textFieldController.text.isNotEmpty;
  //       });
  //     },
  //   );
  // }
}
