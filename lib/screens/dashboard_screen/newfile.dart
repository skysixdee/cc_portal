import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:cc_portal/utilily/strings.dart';

class ToneListTable extends StatelessWidget {
  final RxList<List<CustomTableViewModel>> toneList;

  ToneListTable({required this.toneList});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (toneList.isEmpty) {
        return Center(child: Text(noDataAvailableStr));
      }

      return DataTable(
        columns: toneList[0]
            .map((header) => DataColumn(label: Text(header.title)))
            .toList(),
        rows: toneList
            .skip(1)
            .map((row) => DataRow(
                  cells: row
                      .map((cell) => DataCell(
                            Text(cell.value ?? ''),
                          ))
                      .toList(),
                ))
            .toList(),
      );
    });
  }
}
