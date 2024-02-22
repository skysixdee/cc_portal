import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

class SideMenuListView extends StatefulWidget {
  @override
  _SideMenuListViewState createState() => _SideMenuListViewState();
}

class _SideMenuListViewState extends State<SideMenuListView> {
  int selectedIndex = -1;
  int hoveredIndex = -1;
  TextEditingController searchController = TextEditingController();
  List<String> cardTexts = [
    "Offers",
    "Packs",
    "Circle",
    "Renewal Fallback",
    "Message Template",
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
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 10,
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    ),
  );
}
