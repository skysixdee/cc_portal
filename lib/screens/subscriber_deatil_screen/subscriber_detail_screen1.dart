import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscribe_detail_controller.dart';
import 'package:sm_admin_portal/controllers/subscriber_detail_controler.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/search_number/search_number_view.dart';

class SubscriberDetailScreen1 extends StatefulWidget {
  const SubscriberDetailScreen1({super.key});

  @override
  State<SubscriberDetailScreen1> createState() =>
      _SubscriberDetailScreen1State();
}

class _SubscriberDetailScreen1State extends State<SubscriberDetailScreen1> {
  SubscriberDetailController cont = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          SearchNumberView(
            hintText: "hintText",
            title: "",
            onSearchTap: (searchedText) {
              cont.getDetail(searchedText);
              print("search tapped value is ${searchedText}");
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTableMenuPopupButton(headerColumList: cont.list[0]),
            ],
          ),
          const SizedBox(height: 8),
          Obx(() {
            return CustomTableView(
              cellHeight: 60,
              headerHeight: 60,
              headerBgColor: Colors.teal,
              headerColumList: cont.list[0],
              rowList: cont.list,
              button: (row, colum) {
                return TextButton(
                    onPressed: () {
                      cont.list.removeAt(row);
                    },
                    child: Text("delete"));
              },
            );
          })
        ],
      ),
    );
  }
}
