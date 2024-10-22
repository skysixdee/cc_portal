import 'package:get/get.dart';
import 'package:cc_portal/enums/history_enum.dart';
import 'package:cc_portal/enums/visiblity_type.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view_model.dart';

class HistoryController extends GetxController {
  Rx<HistoryTableType> tableType = HistoryTableType.all.obs;
  Rx<VisibilityType> visibilityType = VisibilityType.empty.obs;

  RxList<CustomTableViewModel> tableMenuList = <CustomTableViewModel>[].obs;
}
