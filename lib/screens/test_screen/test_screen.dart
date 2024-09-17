import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import '../../generic_table_view/generic_table_view.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  RxList<List<GenericTableViewModel>> list =
      <List<GenericTableViewModel>>[].obs;
  @override
  Widget build(BuildContext context) {
    createList();
    return Obx(
      () {
        return list.isEmpty
            ? SMText(title: "List ==${list.length}")
            : GenericTableView(
                list: list,
                rowChild: ({childType, column, row}) {
                  return childType == ChildType.play
                      ? playButton()
                      : button(column!, row!, childType!);
                },
                // rowChild: (column, row, childType) {
                //   return childType == ChildType.play
                //       ? playButton()
                //       : button(column, row, childType);
                //   // SMButton(
                //   //   title: "$column $row",
                //   //   onTap: () {
                //   //     print("C$column, R$row ,$childType");
                //   //   },
                //   // );
                // },
              );
      },
    );
  }

  Widget playButton() {
    return SMButton(
      titlePadding: EdgeInsets.all(0),
      height: 30,
      width: 30,
      bgColor: sixdColor,
      title: "",
      leadingChild: Icon(Icons.play_arrow),
    );
  }

  Widget button(int column, int row, ChildType childType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SMButton(
          height: 30,
          bgColor: red,
          title: "$column $row",
          onTap: () {
            String newq = list[row][column].object as String;
            print("C$column, R$row ,$childType and object $newq");
          },
        ),
      ],
    );
  }

  createList() async {
    List<List<GenericTableViewModel>> list1 = [];
    list1.add(
      [
        GenericTableViewModel(
            columnTitle: "1 title shiv kuma",
            columnValue: "sky",
            childType: ChildType.none),
        GenericTableViewModel(
          columnTitle: "2 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "3 title aryan yadva fas asd asdas ",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "4 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "5 title",
          columnValue: "sky",
        ),
      ],
    );
    list1.add(
      [
        GenericTableViewModel(
          columnTitle: "1 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "2 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "3 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "4 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "5 title",
          columnValue: "sky",
        ),
      ],
    );
    list1.add(
      [
        GenericTableViewModel(
          columnTitle: "1 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "2 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
          columnTitle: "3 title",
          columnValue: "sky",
        ),
        GenericTableViewModel(
            columnTitle: "4 title",
            columnValue: "sky",
            object: "hello",
            childType: ChildType.button),
        GenericTableViewModel(
          columnTitle: "5 title",
          columnValue: "sky",
        ),
      ],
    );
    list.value = list1;
    print("list.value =${list.length}");
  }
}
