import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class TableHeaderView extends StatelessWidget {
  const TableHeaderView({super.key, required this.list, this.bgColor});
  final List<GenericTableViewModel> list;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return tableHeaderView();
  }

  Widget tableHeaderView() {
    return Container(
      color: bgColor ?? grey,
      child: Table(children: [
        TableRow(children: [
          for (int column = 0; column < list.length; column++)
            Padding(
              padding: const EdgeInsets.only(right: 2.0),
              child: Container(
                  child: Center(
                      child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: SMText(
                  title: "${list[column].columnTitle} $column",
                  textAlign: TextAlign.center,
                ),
              ))),
            )
        ]),
      ]),
    );
  }
}
