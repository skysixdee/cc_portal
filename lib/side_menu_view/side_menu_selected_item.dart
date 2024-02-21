/*import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_card.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class SideMenuList extends StatefulWidget {
  @override
  _SideMenuListState createState() => _SideMenuListState();
}

class _SideMenuListState extends State<SideMenuList> {
  int selectedIndex = -1; // Initially no card is selected

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: sideMenuCard(text: 
              "CardTexts($index)",
              isSelected: selectedIndex == index,
            ),
          ),
        );
      },
    );
  }
}*/