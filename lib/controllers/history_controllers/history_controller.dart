import 'package:get/get.dart';
import 'package:sm_admin_portal/enums/history_enum.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';

class HistoryController extends GetxController {
  Rx<HistoryTableType> tableType = HistoryTableType.all.obs;

  RxList<CustomTableViewModel> tableMenuList = <CustomTableViewModel>[].obs;
}
