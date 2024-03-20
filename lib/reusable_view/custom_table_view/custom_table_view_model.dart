import 'package:get/state_manager.dart';

class CustomTableViewModel {
  String title;
  String value;
  bool isRemoveable;
  bool isButton;
  RxBool isVisible;
  dynamic object;

  CustomTableViewModel({
    this.title = 'No title',
    this.value = 'No value ',
    this.isButton = false,
    this.isRemoveable = true,
    this.object,
    required this.isVisible,
  });
}
