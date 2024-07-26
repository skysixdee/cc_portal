import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

class SearchToneIdController extends GetxController {
  ActivateTuneController activateTuneController = Get.find();
  @override
  void onInit() {
    activateTuneController.onSearchTap = (value) {
      print("SearchToneIdController.onSearchTap ==== $value");
    };
    super.onInit();
  }

  onSearchToneIdAction(String text) {
    print("SearchToneIdController");
  }
}
