import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/subscribe_detail_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_menu_popup_button.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';

class SubscriberDetailScreen1 extends StatefulWidget {
  const SubscriberDetailScreen1({super.key});

  @override
  State<SubscriberDetailScreen1> createState() =>
      _SubscriberDetailScreen1State();
}

class _SubscriberDetailScreen1State extends State<SubscriberDetailScreen1> {
  SubscriberDetailController cont = Get.put(SubscriberDetailController());
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTableMenuPopupButton(headerColumList: cont.list[0]),
            ],
          ),
          const SizedBox(height: 8),
          CustomTableView(headerColumList: cont.list[0], rowList: cont.list)
        ],
      ),
    );
  }
}
