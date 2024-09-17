import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericTableViewModel {
  String columnTitle;
  String columnValue;
  ChildType childType;
  Object? object;
  RxBool isVisible;
  GenericTableViewModel({
    required this.isVisible,
    this.columnTitle = 'No title',
    this.columnValue = 'No value ',
    this.childType = ChildType.none,
    this.object,
  });
}

enum ChildType { play, button, none }
