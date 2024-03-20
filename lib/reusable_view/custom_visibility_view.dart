import 'package:flutter/material.dart';
import 'package:sm_admin_portal/enums/visiblity_type.dart';
import 'package:sm_admin_portal/reusable_view/box_shadow.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/constants.dart';

class CustomVisibiltyView extends StatelessWidget {
  const CustomVisibiltyView({super.key});
  final VisibilityType type = VisibilityType.empty;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: _emptyView(),
    );
  }
}

class _emptyView extends StatelessWidget {
  const _emptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boxCornerRadius),
          boxShadow: boxShadow,
          color: white,
        ),
        child: Column(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Container(
                          color: white,
                        ),
                      ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
