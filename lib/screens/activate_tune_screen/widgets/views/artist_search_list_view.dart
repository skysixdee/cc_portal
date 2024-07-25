import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/search_controllers/search_artist_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/subscriber_deatil_screen/widget/tone_list_table.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class ArtistSearchListView extends StatefulWidget {
  const ArtistSearchListView({super.key, required this.artistName});
  final String artistName;
  @override
  State<ArtistSearchListView> createState() => _ArtistSearchListViewState();
}

class _ArtistSearchListViewState extends State<ArtistSearchListView> {
  late SearchArtistController cont;
  @override
  void initState() {
    cont = Get.put(SearchArtistController());
    cont.getArtistList(widget.artistName);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchArtistController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return cont.isLoading.value
            ? loadingIndicatorView()
            : (cont.artistTableList.isEmpty
                ? SMText(title: cont.message.value)
                : tableBuilder());
      },
    );
  }

  Widget tableBuilder() {
    return Obx(() {
      return CustomTableView(
        headerColumList: cont.artistTableList[0],
        rowList: cont.artistTableList,
        child: (row, colum) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMButton(
                height: 30,
                titlePadding: EdgeInsets.symmetric(horizontal: 20),
                title: viewStr,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                bgColor: sixdColor,
                textColor: white,
                onTap: () {
                  print("dsfgdfgdfgd");
                  // Get.dialog(
                  //   barrierDismissible: false,
                  //   Center(
                  //     child: ActivateTunePopup(
                  //       toneName: cont.purchaseList[row][0].value,
                  //       toneId: cont.purchaseList[row][2].value,
                  //     ),
                  //   ),
                  // );
                },
              ),
            ],
          );
        },
      );
    });
  }
}
