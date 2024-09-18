import 'package:get/get.dart';

class GenericTableViewModel {
  String columnTitle;
  String columnValue;
  ChildType childType;
  Object? object;
  RxBool isVisible;

  bool isRemovable;
  //bool isRemoveable;
  GenericTableViewModel({
    required this.isVisible,
    this.columnTitle = 'No title',
    this.columnValue = 'No value ',
    this.childType = ChildType.none,
    this.object,
    this.isRemovable = false,
    //this.isRemoveable = false,
  });
}

enum ChildType { play, button, none, status }
