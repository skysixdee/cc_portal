import 'package:flutter/material.dart';

import 'package:number_paginator/number_paginator.dart';
import 'package:sm_admin_portal/enums/font_name.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

class NumberPagination extends StatefulWidget {
  const NumberPagination(
      {Key? key, required this.totalItem, required this.tappedIndex})
      : super(key: key);
  final int totalItem;
  final Function(int) tappedIndex;
  @override
  _NumberPaginationState createState() => _NumberPaginationState();
}

class _NumberPaginationState extends State<NumberPagination> {
  NumberPaginatorController controller = NumberPaginatorController();
  int _numPages = 0;
  //int _currentPage = 0;
  @override
  void initState() {
    var anc = (widget.totalItem / pagePerCount).ceil(); //.floor(); //
    _numPages = anc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      config: NumberPaginatorUIConfig(
        height: 40,
        buttonPadding: const EdgeInsets.all(0),
        buttonTextStyle:
            TextStyle(fontFamily: FontName.bold.name, fontSize: 12),
        buttonUnselectedForegroundColor: black,
        buttonSelectedBackgroundColor: sixdColor,
      ),
      controller: controller,
      numberPages: _numPages,
      onPageChange: (int index) {
        widget.tappedIndex(index * pagePerCount);
        setState(() {
          print("Page tapped $index");
        });
      },
    );
  }
}
