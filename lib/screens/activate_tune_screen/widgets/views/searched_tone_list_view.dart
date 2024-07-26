import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/search_controllers/search_tone_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_popup.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SearchedToneListView extends StatefulWidget {
  const SearchedToneListView({super.key, required this.seachedText});
  final String seachedText;
  @override
  State<SearchedToneListView> createState() => _SearchedToneListViewState();
}

class _SearchedToneListViewState extends State<SearchedToneListView> {
  late SearchToneController cont; //= Get.find();
  @override
  void initState() {
    cont = Get.put(SearchToneController());
    //cont.searchTone(widget.seachedText);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchToneController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return cont.isLoading.value
            ? Center(child: loadingIndicatorView())
            : cont.purchaseList.isEmpty
                ? Center(
                    child: SMText(title: cont.message.value),
                  )
                : tableBuilder();
      },
    );
  }

  Widget tableBuilder() {
    return Obx(() {
      return CustomTableView(
        headerColumList: cont.purchaseList[0],
        rowList: cont.purchaseList,
        child: (row, colum) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
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
                  Get.dialog(
                    barrierDismissible: false,
                    Center(
                      child: ActivateTunePopup(
                        toneName: cont.purchaseList[row][0].value,
                        toneId: cont.purchaseList[row][2].value,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    });
  }
}
