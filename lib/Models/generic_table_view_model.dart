import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericTableViewModel {
  String columnTitle;
  String columnValue;
  ChildType childType;
  Object? object;
  RxBool isVisible;
  int row;
  int column;
  bool isRemovable;
  //bool isRemoveable;
  GenericTableViewModel({
    required this.isVisible,
    this.columnTitle = 'No title',
    this.columnValue = 'No value ',
    this.childType = ChildType.none,
    this.object,
    this.row = 0,
    this.column = 0,
    this.isRemovable = false,
    //this.isRemoveable = false,
  });
}

enum ChildType {
  play,
  button,
  none,
  status,
  more,
  consent,
  clickableText,
  text
}
