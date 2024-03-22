import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/sm_visibility_view.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/images.dart';
import 'package:sm_admin_portal/utilily/strings.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';
import 'package:sm_admin_portal/controllers/side_menu_controller.dart';

class SideMenuListView extends StatefulWidget {
  @override
  _SideMenuListViewState createState() => _SideMenuListViewState();
}

class _SideMenuListViewState extends State<SideMenuListView> {
  TextEditingController searchController = TextEditingController();

  late SideMenuController cont = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        sideMenuSearchView(searchController),
        ListView.builder(
          padding: EdgeInsets.only(top: 12),
          itemCount: cont.menuList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() {
              return Column(
                children: [
                  menuCard(cont.menuList[index],
                      cont.menuList[index] == cont.selectedMenuTitle.value),
                  smVisibilityView(
                    subMenuListBuilder(),
                    (cont.menuList[index] == cont.selectedMenuTitle.value),
                  )

                  // ?
                  // : SizedBox(),
                ],
              );
            });
          },
        ),
      ],
    );
  }

  Widget subMenuListBuilder() {
    return appCont.isSideMenuHidden.value
        ? SizedBox()
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 4),
            shrinkWrap: true,
            itemCount: cont.subMenuList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: InkWell(
                  onTap: () {
                    cont.selectedSubMenuTitle = cont.subMenuList[index].title;
                    print(
                        "cont.smMenuList[index].route ${cont.subMenuList[index].route}");
                    context.goNamed(cont.subMenuList[index].route);

                    cont.onSubMenuCardTap(cont.subMenuList[index].title);
                  },
                  child: sideSubMenuCard(
                      text: cont.subMenuList[index].title,
                      isSelected: cont.selectedSubMenuTitle ==
                          cont.subMenuList[index].title),
                ),
              );
            },
          );
  }

  Widget menuCard(String title, bool isSelected) {
    //bool isSelected = true;
    return InkWell(
      onTap: () {
        appCont.isSideMenuHidden.value = false;
        cont.onMenuCardTap(title);
        print("====== $title}");
        print("+++++++++${cont.selectedMenuTitle}");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                  width: 40,
                  child: Icon(
                    Icons.person,
                    size: 18,
                  )),
              appCont.isSideMenuHidden.value
                  ? SizedBox()
                  : Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SMText(
                              title: title,
                              textColor: sixdColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: smVisibilityView(
                                  Image.asset(
                                    chevronDownPng,
                                    color: sixdColor,
                                    height: 12,
                                  ),
                                  isSelected,
                                  secondChild: Image.asset(
                                    chevronRightPng,
                                    color: sixdColor,
                                    height: 12,
                                  ))),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

//isSelected ? chevronDownPng :
  Widget sideMenuSearchView(TextEditingController searchController) {
    return Obx(
      () {
        return appCont.isSideMenuHidden.value
            ? InkWell(
                onTap: () {
                  appCont.isSideMenuHidden.value = false;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: searchIcon(),
                ))
            : Row(
                children: [
                  SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 8),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: searchMenuItemStr,
                            hintStyle: TextStyle(fontSize: 10),
                            border: InputBorder.none,
                            suffixIcon: searchIcon(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }

  Icon searchIcon() {
    return Icon(
      Icons.search,
      size: 15,
    );
  }
}
