import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/enums/search_type.dart';

import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/artist_search_list_view.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/searched_tone_list_view.dart';
import 'package:sm_admin_portal/screens/activate_tune_screen/widgets/views/searched_toneid_list_view.dart';

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
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        SMText(title: toneActivationStr),
        SizedBox(
          child: activateTuneTextField(TextEditingController()), //textField(),
          width: 400,
        ),
        activateTuneSearchTypeBuilder(cont),
        SizedBox(height: 10),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Obx(() {
              return cont.searchType.value == SearchType.singer
                  ? ArtistSearchListView(artistName: cont.searchedText)
                  : (cont.searchType.value == SearchType.songCode
                      ? SearchedToneidListView()
                      : SearchedToneListView(
                          seachedText: cont.searchedText,
                        ));
            }),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
