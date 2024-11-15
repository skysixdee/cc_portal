import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/enums/font_name.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/utilily/colors.dart';

class TableRowListView extends StatelessWidget {
  TableRowListView(
      {super.key, required this.list, this.rowChild, this.tableBgColor});
  List<List<GenericTableViewModel>> list;
  final Function({GenericTableViewModel info})? rowChild;
  final Color? tableBgColor;
  @override
  Widget build(BuildContext context) {
    return tableHeaderView();
  }

  Widget tableHeaderView() {
    return Table(children: [
      TableRow(children: [rowBuilder()]),
    ]);
  }

  Widget rowBuilder() {
    return Column(
      children: [
        for (int row = 0; row < list.length; row++)
          Container(
              color: greyLight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0),
                child: Container(
                  color: tableBgColor ?? white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: tableColumnBuilder(row),
                  ),
                ),
              ))
      ],
    );
  }

  Widget tableColumnBuilder(int row) {
    return Obx(
      () {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            for (int column = 0; column < list[row].length; column++)
              if (list[0][column].isVisible.value)
                Expanded(
                  child: Container(
                      color: white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: column == 0 ? 12.0 : 0,
                            right: column == 0 ? 12 : 0),
                        child: row1(row, column),
                      )),
                )
          ],
        );
      },
    );
  }

  Widget row1(int row, int column) {
    GenericTableViewModel model = list[row][column];
    model.row = row;
    model.column = column;
    return list[row][column].childType == ChildType.none
        ? SMText(
            title: list[row][column].columnValue,
            fontWeight: FontWeight.normal,
            textAlign: column == 0 ? TextAlign.start : TextAlign.center)
        : (rowChild != null
            ? rowChild!(info: model)
            : Center(
                child: Container(
                    color: sixdColor,
                    child: SMText(
                      title: "pass Child",
                      textColor: white,
                    ))));
  }
}
