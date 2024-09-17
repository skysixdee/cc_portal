import 'package:flutter/material.dart';

class GenericTableViewModel {
  String columnTitle;
  String columnValue;
  ChildType childType;
  Object? object;
  GenericTableViewModel(
      {this.columnTitle = 'No title',
      this.columnValue = 'No value ',
      this.childType = ChildType.none,
      this.object});
}

enum ChildType { play, button, none }
