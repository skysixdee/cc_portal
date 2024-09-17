import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class TableHeaderView extends StatelessWidget {
  const TableHeaderView({super.key, required this.list});
  final List<GenericTableViewModel> list;
  @override
  Widget build(BuildContext context) {
    return tableHeaderView();
  }

  Widget tableHeaderView() {
    return Table(children: [
      TableRow(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int column = 0; column < list.length; column++)
              SMText(title: "${list[column].columnTitle} $column")
          ],
        )
      ]),
    ]);
  }
}
