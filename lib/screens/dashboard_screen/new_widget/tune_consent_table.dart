import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/new_dash_board_controller.dart';
import 'package:sm_admin_portal/generic_table_view/generic_table_view.dart';
import 'package:sm_admin_portal/reusable_view/status_bullet.dart';
import 'package:sm_admin_portal/screens/dashboard_screen/dashboard_new_screen.dart';

class TuneConsentTable extends StatelessWidget {
  TuneConsentTable({super.key});
  NewDashBoardController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: SizedBox(
        width: 800,
        child: GenericTableView(
          list: con.tuneConsentTableList,
          rowChild: ({info}) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                statusBullet("A"),
              ],
            );
          },
        ),
      ),
    );
  }
}
