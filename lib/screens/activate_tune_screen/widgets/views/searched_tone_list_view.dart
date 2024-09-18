import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/Models/generic_table_view_model.dart';
import 'package:sm_admin_portal/Models/tone_info.dart';
import 'package:sm_admin_portal/controllers/search_controllers/search_tone_controller.dart';
import 'package:sm_admin_portal/generic_table_view/generic_table_view.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/number_pagination.dart';
import 'package:sm_admin_portal/reusable_view/play_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Obx(
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

  // Widget playButton() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       InkWell(
  //         onTap: () {
  //           print("Play button tapped");
  //         },
  //         child: Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15),
  //             color: sixdColor,
  //           ),
  //           height: 30,
  //           width: 30,
  //           child: Icon(
  //             Icons.play_arrow,
  //             color: white,
  //             size: 15,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget activateButton(GenericTableViewModel? info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SMButton(
          height: 30,
          title: activateStr,
          textColor: white,
          bgColor: sixdColor,
          fontWeight: FontWeight.normal,
          onTap: () {
            ToneInfo inf = info?.object as ToneInfo;
            print("tapped ${inf.toneName}");
            print("tapped ${inf.toneIdStreamingUrl}");
            openBuyTunePopup(inf.toneName ?? '', inf.artistName ?? '');
          },
        ),
      ],
    ); //Container(height: 30,width: 30,color: sixdColor,child: Icon(Icons.play_arrow),);
  }

  Widget tableBuilder() {
    //return Obx(() {
    return GenericTableView(
      list: cont.purchaseList,
      rowChild: ({GenericTableViewModel? info}) {
        return info?.childType == ChildType.play
            ? playButton(((info?.object) as ToneInfo).toneId ?? '')
            : activateButton(info);
      },
    );
  }
}
