import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sm_admin_portal/Models/side_menu_model.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

class SideMenuListView extends StatefulWidget {
  @override
  _SideMenuListViewState createState() => _SideMenuListViewState();
}

class _SideMenuListViewState extends State<SideMenuListView> {
  int selectedIndex = -1;
  String selectedRoute = '';
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
        filteredCards = cardTexts
            .where((card) => card.toLowerCase().contains(query))
            .toList();
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
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: sideMenuCard(
                    text: filteredCards[index],
                    isSelected:
                        (selectedIndex == index) || (hoveredIndex == index),
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
//border: Border.all(color: black),
    //  borderRadius: BorderRadius.circular(2));

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
          hintText: 'Search...', hintStyle: TextStyle(fontSize: 10),
          border: InputBorder.none,
          //iconColor: Colors.red,
          suffixIcon: Icon(
            Icons.search,
            size: 15,
          ),
        ),
      ),
    ),
  );
}
