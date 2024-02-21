import 'package:flutter/material.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

Widget sideMenuSearchView() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 10,
          blurRadius: 8,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    ),
  );
}
