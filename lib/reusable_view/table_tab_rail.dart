import 'package:flutter/material.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';

class TableTabRail extends StatelessWidget {
  const TableTabRail({
    super.key,
    required this.selectedTab,
    required this.tabTitleList,
    required this.onTap,
    this.height = 45,
    this.borderWidth = 1,
  });
  final int selectedTab;
  final double height;
  final double borderWidth;
  final Function(int) onTap;
  final List<String> tabTitleList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: yellow,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: white,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: grey,
                      height: borderWidth,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: tabTitleList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onTap(index);
                  },
                  child: IntrinsicWidth(
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: borderWidth,
                                      color: selectedTab == index
                                          ? grey
                                          : transparent),
                                  left: BorderSide(
                                      width: borderWidth,
                                      color: selectedTab == index
                                          ? grey
                                          : transparent),
                                  right: BorderSide(
                                      width: borderWidth,
                                      color: selectedTab == index
                                          ? grey
                                          : transparent)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4)),
                              color: white,
                            ),
                            height: height,
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: SMText(title: tabTitleList[index]),
                            )),
                            //width: 60,
                          ),
                        ),
                        Container(
                          height: borderWidth,
                          color: selectedTab == index ? white : grey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
