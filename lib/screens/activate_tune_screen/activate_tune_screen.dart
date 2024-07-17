import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sm_admin_portal/controllers/activate_tune_controller.dart';
import 'package:sm_admin_portal/enums/search_type.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/reusable_view/sm_text_field/sm_text_field.dart';

class ActivateTuneScreen extends StatelessWidget {
  ActivateTuneScreen({super.key});

  final ActivateTuneController cont = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SMText(title: toneActivationStr),
            SmTextField(
              textEditingController: TextEditingController(),
              hint: enterKeyWordToSearchStr,
              tailingWidget: searchButton(),
            ),
            listBuilder(),
          ],
        ),
      ),
    );
  }

  Widget searchButton() {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.search,
            size: 16,
          ),
        ));
  }

  SizedBox listBuilder() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cont.searchTypeList.length,
        itemBuilder: (context, index) {
          return radioButton(
              cont.searchTypeList[index], cont.searchTypeTitlList[index]);
        },
      ),
    );
  }

  Widget radioButton(SearchType searchType, String title) {
    return Obx(() {
      return InkWell(
        focusColor: transparent,
        hoverColor: transparent,
        splashColor: transparent,
        highlightColor: transparent,
        onTap: () {
          //cont.searchType.value =
          cont.updateSearchType(searchType);
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                searchType == cont.searchType.value
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                size: 16,
              ),
              SizedBox(width: 2),
              SMText(
                title: title,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      );
    });
  }
}
