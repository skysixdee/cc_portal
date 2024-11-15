import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/Models/tone_info.dart';
import 'package:cc_portal/controllers/search_controllers/search_tone_id_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/buttons/activate_tune_button.dart';
import 'package:cc_portal/reusable_view/buttons/play_button.dart';
import 'package:cc_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:cc_portal/reusable_view/number_pagination.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/strings.dart';

class SearchedToneidListView extends StatefulWidget {
  const SearchedToneidListView({super.key});

  @override
  State<SearchedToneidListView> createState() => _SearchedToneidListViewState();
}

class _SearchedToneidListViewState extends State<SearchedToneidListView> {
  late SearchToneIdController cont;
  @override
  void initState() {
    cont = Get.put(SearchToneIdController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchToneIdController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return cont.isLoading.value
                ? loadingIndicatorView()
                : (cont.tuneList.isEmpty)
                    ? Center(
                        child: SMText(
                        title: cont.message.value,
                        fontSize: 16,
                      ))
                    : tableBuilder();
          },
        ),
        numberPageBuilder(),
      ],
    );
  }

  Obx numberPageBuilder() {
    return Obx(
      () {
        return cont.totolCount < pagePerCount
            ? SizedBox()
            : NumberPagination(
                totalItem: cont.totolCount.value,
                tappedIndex: (value) {
                  print("tapped on $value");
                  cont.loadMoreData(value);
                });
      },
    );
  }

  Widget tableBuilder() {
    return GenericTableView(
      headerScrollable: true,
      addMenuButton: true,
      list: cont.tuneList,
      rowChild: ({info}) {
        ToneInfo inf = info?.object as ToneInfo;
        return (info?.childType == ChildType.play)
            ? playButton(inf.toneId ?? '', inf.toneIdStreamingUrl ?? '')
            : activateButton(info);
      },
    );
    /*
    CustomTableView(
      headerColumList: cont.tuneList[0],
      rowList: cont.tuneList,
      childWidget: (row, colum) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SMButton(
              height: 30,
              titlePadding: EdgeInsets.symmetric(horizontal: 20),
              title: activateStr,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              bgColor: sixdColor,
              textColor: white,
              onTap: () {
                openBuyTunePopup(
                    cont.tuneList[row][0].value, cont.tuneList[row][1].value);
              },
            ),
          ],
        );
      },
    );
    */
  }
}
