import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/generic_table_view/widgets/table_header_view.dart';
import 'package:sm_admin_portal/generic_table_view/widgets/table_row_list_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/table_view.dart';

class GenericTableView extends StatelessWidget {
  GenericTableView({super.key, required this.list, this.rowChild});
  final List<List<GenericTableViewModel>> list;
  final Function({int? column, int? row, ChildType? childType})? rowChild;
  @override
  Widget build(BuildContext context) {
    print("list sky === ${list.length}");
    return list.isEmpty
        ? Center(child: SMText(title: "Empty List"))
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TableHeaderView(list: list[0]),
              Flexible(
                child: ListView(shrinkWrap: true, children: [
                  TableRowListView(
                    list: list,
                    rowChild: rowChild,
                  ),
                ]),
              ),
            ],
          );
  }
}
