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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sm_admin_portal/Models/side_menu_model.dart';
import 'package:sm_admin_portal/router/router_name.dart';
import 'package:sm_admin_portal/screens/tone_activation_screen.dart';
import 'package:sm_admin_portal/screens/renewal_screen.dart';
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
    SideMenuModel("Subscriber Deatil", "/Circle"),
    SideMenuModel("Renewal Fallback", "/Renewal_Fallback"),
    SideMenuModel("Tone Activation", "/Tone_Activation"),
    SideMenuModel("Message", "/message"),
    SideMenuModel("Bulk", "/bulk"),
    SideMenuModel("History", "/history"),
  ];
  List<String> cardTexts = [
    "Offers",
    "Packs",
    "Subscriber Deatil",
    "Renewal Fallback",
    "Tone Activation",
    "message",
    "Bulk",
    "History",
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
        // Check if the selected card matches the search query
        if (selectedIndex != -1 &&
            cardTexts[selectedIndex].toLowerCase().contains(query)) {
          filteredCards = [cardTexts[selectedIndex]];
        } else {
          // Filter based on the search query, including the selected card
          filteredCards = cardTexts
              .where((card) =>
                  card.toLowerCase().contains(query) ||
                  (selectedIndex != -1 && card == cardTexts[selectedIndex]))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    if (index == 0) {
                      context.goNamed(OffersScreenRoute);
                    } else if (index == 1) {
                      context.goNamed(PacksScreenRoute);
                    } else if (index == 2) {
                      context.goNamed(subscriberDetailRoute);
                    } else if (index == 3) {
                      context.goNamed(RenewalScreenRoute);
                    } else if (index == 4) {
                      context.goNamed(MessageTemplateScreenRoute);
                    } else if (index == 5) {
                      context.goNamed(MessageScreenRoute);
                    } else if (index == 6) {
                      context.goNamed(bulkScreenRoute);
                    } else {
                      context.goNamed(historyScreenRoute);
                    }
                    //else (index == 3){}

                    setState(() {
                      selectedIndex = cardTexts.indexOf(filteredCards[index]);
                    });
                  },
                  child: sideMenuCard(
                    text: filteredCards[index],
                    isSelected: (selectedIndex ==
                            cardTexts.indexOf(filteredCards[index])) ||
                        (hoveredIndex == index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

Widget sideMenuSearchView(TextEditingController searchController) {
  return Container(
    height: 30,
    width: 165,
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
