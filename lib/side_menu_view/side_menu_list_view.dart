/*import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/Models/side_menu_model.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

class SideMenuListView extends StatefulWidget {
  @override
  _SideMenuListViewState createState() => _SideMenuListViewState();
}

class _SideMenuListViewState extends State<SideMenuListView> {
  int selectedIndex = -1;
  int hoveredIndex = -1;
  TextEditingController searchController = TextEditingController();
  List<SideMenuModel> modelList = [
    SideMenuModel("Offers", "/offers"),
    SideMenuModel("Packs", "/Packs"),
    SideMenuModel("Circle", "/Circle"),
    SideMenuModel("Renewal Fallback", "/Renewal_Fallback"),
    SideMenuModel("Message Template", "/Message_Template"),
    SideMenuModel("Message", "/message"),
  ];
  List<String> cardTexts = [
    "Offers",
    "Packs",
    "Circle",
    "Renewal Fallback",
    "Message Template",
    "message"
  ];

  List<String> filteredCards = [];

  @override
  void initState() {
    super.initState();
    filteredCards = cardTexts;
    searchController.addListener(filterSearchResults);
  }

  void filterSearchResults() {
    setState(() {
      String query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        filteredCards = cardTexts;
      } else {
        if (selectedIndex != -1 &&
            cardTexts[selectedIndex].toLowerCase().contains(query)) {
          filteredCards = [cardTexts[selectedIndex]];
        } else {
          filteredCards = cardTexts
              .where((card) => card.toLowerCase().contains(query) ||
                  (selectedIndex != -1 &&
                      card == cardTexts[selectedIndex]))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Side Menu
        Container(
          width: 200, // Adjust width as needed
          child: Column(
            children: modelList.map((item) {
              int index = modelList.indexOf(item);
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  GoRouter.of(context).go(item.route);
                },
                child: sideMenuCard(
                  text: item.title,
                  isSelected: selectedIndex == index || hoveredIndex == index,
                ),
              );
            }).toList(),
          ),
        ),

        // Vertical Divider (Adjust as needed)
        VerticalDivider(),

        // Content
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 10),
              sideMenuSearchView(searchController),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredCards.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: InkWell(
                        onHover: (value) {
                          setState(() {
                            if (value) {
                              hoveredIndex = index;
                            } else {
                              hoveredIndex = -1;
                            }
                          });
                        },
                        onTap: () {
                          GoRouter.of(context).go(modelList[index].route);
                        },
                        child: sideMenuCard(
                          text: filteredCards[index],
                          isSelected: (selectedIndex == cardTexts.indexOf(filteredCards[index])) || (hoveredIndex == index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget sideMenuSearchView(TextEditingController searchController) {
  return Container(
    height: 30,
    width: double.infinity, // Adjust width as needed
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(fontSize: 10),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            size: 15,
          ),
        ),
      ),
    ),
  );
}
*/

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/Models/side_menu_model.dart';
import 'package:sm_admin_portal/controllers/side_menu_controller.dart';
import 'package:sm_admin_portal/main.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/tone_activation_screen.dart';
import 'package:sm_admin_portal/screens/renewal_screen.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/images.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

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
          itemCount: cont.menuList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Obx(() {
              return menuCard(cont.menuList[index],
                  cont.menuList[index] == cont.selectedMenuTitle.value);
            });
          },
        ),
        subMenuListBuilder(),
      ],
    );
  }

  Expanded subMenuListBuilder() {
    return Expanded(child: Obx(() {
      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12),
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
    }));
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
        padding: const EdgeInsets.symmetric(vertical: 0.5),
        child: Container(
          height: 40,
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
                          SMText(
                            title: title,
                            textColor: sixdColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Image.asset(
                              isSelected ? chevronDownPng : chevronRightPng,
                              color: sixdColor,
                              height: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

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
