import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';

class SearchedToneidListView extends StatefulWidget {
  const SearchedToneidListView({super.key});

  @override
  State<SearchedToneidListView> createState() => _SearchedToneidListViewState();
}

class _SearchedToneidListViewState extends State<SearchedToneidListView> {
  @override
  Widget build(BuildContext context) {
    return SMText(title: "SearchedToneidListView");
  }
}
