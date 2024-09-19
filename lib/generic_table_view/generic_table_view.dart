import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/generic_table_view/widgets/generic_table_view_menu.dart';
import 'package:sm_admin_portal/generic_table_view/widgets/table_header_view.dart';
import 'package:sm_admin_portal/generic_table_view/widgets/table_row_list_view.dart';
import 'package:sm_admin_portal/reusable_view/reusable_drop_down_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/table_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class GenericTableView extends StatelessWidget {
  GenericTableView({
    super.key,
    required this.list,
    this.rowChild,
    this.menu,
    this.addMenuButton = false,
    this.headerScrollable = false,
  });
  final List<List<GenericTableViewModel>> list;
  final Widget? menu;
  final bool addMenuButton;
  final bool headerScrollable;
  //final bool tableScrollable;
  final Function({GenericTableViewModel? info})? rowChild;
  @override
  Widget build(BuildContext context) {
    print("list sky === ${list.length}");
    return list.isEmpty
        ? Center(
            child: SizedBox(
                height: 200, child: Center(child: SMText(title: "Empty List"))))
        : ListView(
            shrinkWrap: true,
            physics: headerScrollable ? null : NeverScrollableScrollPhysics(),
            children: [
              addMenuButton ? menu ?? menuButton(list[0]) : SizedBox(),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Column(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  children: [
                    TableHeaderView(list: list[0]),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: greyLight, width: 1)),
                      child: ListView(
                        shrinkWrap: true,
                        physics: headerScrollable
                            ? null
                            : NeverScrollableScrollPhysics(),
                        children: [
                          TableRowListView(
                            list: list,
                            rowChild: rowChild,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
