import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BuyTuneController extends GetxController {
  RxBool isConfirming = false.obs;
  RxString errorMessage = ''.obs;
}
