import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';

class SideMenuListView extends StatefulWidget {
  @override
  _SideMenuListViewState createState() => _SideMenuListViewState();
}

class _SideMenuListViewState extends State<SideMenuListView> {
  int selectedIndex = -1;
  int hoveredIndex = -1; // Initially no card is selected

  @override
  Widget build(BuildContext context) {
    List<String> cardTexts = [
      "Offers",
      "Packs",
      "Circle",
      "Renewal Fallback",
      "Message Template",
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: cardTexts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  hoveredIndex = index;
                });
              },
              onExit: (_) {
                setState(() {
                  hoveredIndex = -1;
                });
              },
              child: sideMenuCard(
                text: cardTexts[index],
                isSelected: (selectedIndex == index) || (hoveredIndex == index),
              ),
            ),
          ),
        );
      },
    );
  }
}
