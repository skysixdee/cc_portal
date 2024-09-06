import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class GenericTableView extends StatelessWidget {
  GenericTableView({super.key, required this.list});
  final List<GenericTableViewModel> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tableHeaderView(),
      ],
    );
  }

  Widget tableHeaderView() {
    return Table(children: [
      TableRow(children: [
        for (int column = 0; column < 10; column++)
          SMText(title: "title $column")
      ]),
    ]);
  }
}
