import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/controllers/search_controllers/search_artist_controller.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/buy_tune_popup.dart';
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
    //cont.getArtistList(widget.artistName);
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
            : (cont.artistNameTableList.isEmpty
                ? SMText(title: cont.message.value)
                : cont.isArtistNameTable.value
                    ? artistNameTableBuilder()
                    : artistTunesTableBuilder());
      },
    );
  }

  Widget artistTunesTableBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SMButton(
            leadingChild: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(buttonCornerRadius),
                    color: sixdColor,
                  ),
                  child: Center(
                      child: Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: white,
                  ))),
            ),
            title: cont.artistName,
            titlePadding: EdgeInsets.zero,
            onTap: () {
              cont.isArtistNameTable.value = true;
            },
          ),
        ),
        Flexible(
          child: Obx(() {
            return CustomTableView(
                headerColumList: cont.artistsTuneTableList[0],
                rowList: cont.artistsTuneTableList,
                child: (row, colum) {
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
                              cont.artistsTuneTableList[row][0].value,
                              cont.artistsTuneTableList[row][1].value);
                          // Get.dialog(
                          //   barrierDismissible: false,
                          //   Center(
                          //     child: BuyTunePopup(
                          //       toneName:
                          //           cont.artistsTuneTableList[row][0].value,
                          //       toneId: cont.artistsTuneTableList[row][1].value,
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  );
                });
          }),
        )
      ],
    );
  }

  Widget artistNameTableBuilder() {
    return Obx(() {
      return CustomTableView(
        headerColumList: cont.artistNameTableList[0],
        rowList: cont.artistNameTableList,
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
                  cont.isArtistNameTable.value = false;
                  cont.getArtistTuneList(
                      cont.artistNameTableList[row][0].value);
                  print("dsfgdfgdfgd");
                },
              ),
            ],
          );
        },
      );
    });
  }
}
