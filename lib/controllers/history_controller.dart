import 'package:get/get.dart';
import 'package:sm_admin_portal/enums/history_enum.dart';

class HistoryController extends GetxController {
  Rx<HistoryTableType> tableType = HistoryTableType.all.obs;
}
