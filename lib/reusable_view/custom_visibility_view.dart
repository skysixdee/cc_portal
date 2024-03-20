import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/enums/visiblity_type.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';
import 'package:sm_admin_portal/utilily/images.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class CustomVisibiltyView extends StatelessWidget {
  const CustomVisibiltyView({super.key, this.child, required this.type});
  final VisibilityType type;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: loadViewType(type));
  }

  Widget loadViewType(VisibilityType type) {
    print("Type ========= $type");
    if (type == VisibilityType.empty) {
      return _emptyView();
    } else if (type == VisibilityType.loading) {
      return _loadingView();
    } else if (type == VisibilityType.loaded) {
      return child ?? SizedBox();
    } else {
      return _emptyView();
    }
  }
}

class _loadingView extends StatelessWidget {
  const _loadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        width: 300,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxCornerRadius * 2),
          boxShadow: boxShadow,
          color: white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: sixdColor,
            ),
            const SizedBox(height: 10),
            SMText(
              title: loadingMessageStr,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}

class _emptyView extends StatelessWidget {
  const _emptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 280,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxCornerRadius),
          boxShadow: boxShadow,
          color: white,
        ),
        child: Column(
          children: [
            emptyHeaderView(),
            Expanded(child: emptyMessage()),
          ],
        ),
      ),
    );
  }

  Center emptyMessage() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            cloudPng,
            height: 80,
          ),
          const SizedBox(height: 8),
          SMText(
            textAlign: TextAlign.center,
            title: noDataMessageStr,
            textColor: redColor,
          )
        ],
      ),
    );
  }

  Column emptyHeaderView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: 40,
            color: greyLight,
            child: Row(
              children: [
                for (int i = 0; i < 6; i++)
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      color: white,
                    ),
                  ))
              ],
            )),
      ],
    );
  }
}
