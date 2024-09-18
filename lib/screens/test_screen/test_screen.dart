import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/activate_tune_screen.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import '../../generic_table_view/generic_table_view.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  RxList<List<GenericTableViewModel>> list =
      <List<GenericTableViewModel>>[].obs;
  @override
  Widget build(BuildContext context) {
    createList();
    return //ActivateTuneScreen();
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 30),
      child: Obx(
        () {
          return list.isEmpty
              ? SMText(title: "List ==${list.length}")
              : GenericTableView(
                  list: list,
                  // rowChild: ({childType, column, row}) {
                  //   return childType == ChildType.play
                  //       ? playButton()
                  //       : button(column!, row!, childType!);
                  // },
                );
        },
      ),
    );
  }

  Widget playButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SMButton(
          titlePadding: EdgeInsets.all(0),
          height: 30,
          width: 30,
          bgColor: sixdColor,
          title: "",
          leadingChild: Icon(Icons.play_arrow),
        ),
      ],
    );
  }

  Widget button(int column, int row, ChildType childType) {
    return Obx(
      () {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SMButton(
              height: 30,
              bgColor: red,
              title: "${list[0][1].isVisible.value} $column $row",
              onTap: () {
                String newq = list[row][column].object as String;
                list[0][2].isVisible.value = !list[0][2].isVisible.value;

                print("Hello ${list[row][column].isVisible.value}");
                print("C$column, R$row ,$childType and object $newq");
              },
            ),
          ],
        );
      },
    );
  }

  createList() async {
    List<List<GenericTableViewModel>> list1 = [];
    for (var i = 0; i < 20; i++) {
      list1.add(
        [
          GenericTableViewModel(
            isVisible: true.obs,
            columnTitle: "Column1",
            columnValue: "sky",
          ),
          GenericTableViewModel(
            isVisible: true.obs,
            columnTitle: "Column2",
            columnValue: "sky",
          ),
          GenericTableViewModel(
            isVisible: true.obs,
            columnTitle: "Column3",
            columnValue: "sky",
          ),
          GenericTableViewModel(
            isVisible: false.obs,
            columnTitle: "Column4",
            columnValue: "sky",
            isRemovable: true,
          ),
          GenericTableViewModel(
            isVisible: false.obs,
            columnTitle: "Column5",
            columnValue: "sky",
            isRemovable: true,
          ),
        ],
      );
    }

    list.value = list1;
    print("list.value =${list.length}");
  }
}
