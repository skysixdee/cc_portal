import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sm_admin_portal/controllers/search_controllers/search_tone_id_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/number_pagination.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

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
                : (cont.purchaseList.isEmpty)
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
    return CustomTableView(
      headerColumList: cont.purchaseList[0],
      rowList: cont.purchaseList,
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
                openBuyTunePopup(cont.purchaseList[row][0].value,
                    cont.purchaseList[row][1].value);
              },
            ),
          ],
        );
      },
    );
  }
}
