import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';

import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/artist_search_list_view.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/searched_tone_list_view.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/searched_toneid_list_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';

import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_textfield.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/activate_tune_search_type_builder.dart';

class ActivateTuneScreen extends StatelessWidget {
  ActivateTuneScreen({super.key});

  final ActivateTuneController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding:
              const EdgeInsets.only(top: 4, left: 20, right: 20, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: greyLight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, right: 20, left: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SMText(
                        title: toneActivationStr,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      languageSwitch(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: activateTuneTextField(
                                    TextEditingController()), //textField(),
                                width: 400,
                              ),
                            ],
                          ),
                          activateTuneSearchTypeBuilder(cont),
                        ],
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: SMButton(
                          height: 43,
                          width: 140,
                          bgColor: sixdColor,
                          textColor: white,
                          title: searchCStr,
                          onTap: () {
                            cont.searchText();
                            if (cont.onSearchTap != null) {
                              cont.onSearchTap!(cont.searchedText);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Obx(() {
              return Directionality(
                textDirection: cont.isEnglish.value
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: cont.searchType.value == SearchType.singer
                    ? ArtistSearchListView(artistName: cont.searchedText)
                    : (cont.searchType.value == SearchType.songCode
                        ? SearchedToneidListView()
                        : SearchedToneListView(
                            seachedText: cont.searchedText,
                          )),
              );
            }),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget languageSwitch() {
    return Row(
      children: [
        SMText(
          title: 'Search in arabic',
          fontWeight: FontWeight.normal,
        ),
        Obx(
          () {
            return CupertinoSwitch(
              activeColor: sixdColor,
              value: !cont.isEnglish.value,
              onChanged: (value) {
                print("is changed");
                cont.isEnglish.value = !cont.isEnglish.value;
                cont.searchText();
                if (cont.onSearchTap != null) {
                  cont.onSearchTap!(cont.searchedText);
                }
              },
            );
          },
        ),
      ],
    );
  }
}
