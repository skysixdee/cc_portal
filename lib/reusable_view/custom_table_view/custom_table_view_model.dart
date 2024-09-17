import 'package:get/state_manager.dart';

class CustomTableViewModel {
  String title;
  String value;
  bool isRemoveable;
  bool isButton;
  bool isactivationButton;
  bool isSMButton;
  RxBool isVisible;
  dynamic object;

  CustomTableViewModel({
    this.title = 'No title',
    this.value = 'No value ',
    this.isButton = false,
    this.isSMButton = false,
    this.isactivationButton = false,
    this.isRemoveable = true,
    this.object,
    required this.isVisible,
  });
}
