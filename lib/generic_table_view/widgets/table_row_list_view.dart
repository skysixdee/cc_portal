import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class TableRowListView extends StatelessWidget {
  TableRowListView({super.key, required this.list, this.rowChild});
  List<List<GenericTableViewModel>> list;
  final Function({int column, int row, ChildType childType})? rowChild;
  @override
  Widget build(BuildContext context) {
    return tableHeaderView();
  }

  Widget tableHeaderView() {
    return Table(children: [
      TableRow(children: [
        rowBuilder(),
      ]),
    ]);
  }

  Column rowBuilder() {
    return Column(
      children: [
        for (int row = 0; row < list.length; row++) tableColumnBuilder(row)
        //SMText(title: "column $row")
      ],
    );
  }

  Widget tableColumnBuilder(int row) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        for (int column = 0; column < list[row].length; column++)
          row1(row, column)
      ],
    );
  }

  Widget row1(int row, int column) {
    return list[row][column].childType == ChildType.none
        ? SMText(
            title: "${list[row][column].columnValue} $column",
            textAlign: TextAlign.center,
          )
        : (rowChild != null
            ? rowChild!(
                column: column,
                row: row,
                childType: list[row][column].childType)
            : SMText(title: "pass Child"));
  }
}
