import 'package:cc_portal/common/date_formate.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/strings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:cc_portal/generic_table_view/generic_table_view.dart';

import 'package:cc_portal/controllers/history_controllers/history_controller.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/screens/history_screen_new/widgets/history_search_view_new.dart';

class HistoryScreenNew extends StatefulWidget {
  const HistoryScreenNew({super.key});

  @override
  State<HistoryScreenNew> createState() => _HistoryScreenNewState();
}

class _HistoryScreenNewState extends State<HistoryScreenNew> {
  HistoryController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20),
          headerView(),
          SizedBox(height: 20),
          tableView(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget headerView() {
    return HistorySearchViewNew();
  }

  Widget tableView() {
    return Obx(
      () {
        return con.isLoading.value
            ? loadingIndicatorView()
            : con.historyList.isEmpty
                ? noTransactionFound()
                : GenericTableView(
                    list: con.historyList,
                    addMenuButton: true,
                    rowChild: ({info}) {
                      return SMText(
                        title: dateFormate(info?.columnValue ?? ''),
                        fontWeight: FontWeight.normal,
                      );
                    },
                  );
      },
    );
  }

  Widget noTransactionFound() {
    return Center(child: SMText(title: noTransactionFoundStr));
  }
}
