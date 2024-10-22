import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cc_portal/Models/generic_table_view_model.dart';
import 'package:cc_portal/Models/tone_info.dart';
import 'package:cc_portal/controllers/search_controllers/search_tone_controller.dart';
import 'package:cc_portal/generic_table_view/generic_table_view.dart';
import 'package:cc_portal/reusable_view/buttons/activate_tune_button.dart';

import 'package:cc_portal/reusable_view/number_pagination.dart';
import 'package:cc_portal/reusable_view/buttons/play_button.dart';
import 'package:cc_portal/reusable_view/sm_button.dart';
import 'package:cc_portal/reusable_view/sm_text.dart';
import 'package:cc_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:cc_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/utilily/constants.dart';
import 'package:cc_portal/utilily/strings.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Obx(
          () {
            return cont.isLoading.value
                ? Center(child: loadingIndicatorView())
                : cont.purchaseList.isEmpty
                    ? Center(
                        child: SMText(
                          title: cont.message.value,
                          fontSize: 16,
                        ),
                      )
                    : tableBuilder();
          },
        ),
        numberPageBuilder()
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
      addMenuButton: true,
      headerScrollable: true,
      list: cont.purchaseList,
      rowChild: ({GenericTableViewModel? info}) {
        ToneInfo inf = ((info?.object) as ToneInfo);
        return info?.childType == ChildType.play
            ? playButton(inf.toneId ?? '', inf.toneIdStreamingUrl ?? '')
            : activateButton(info);
      },
    );
  }
}
