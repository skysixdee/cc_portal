import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view.dart';
import 'package:sm_admin_portal/reusable_view/custom_table_view/custom_table_view_model.dart';
import 'package:sm_admin_portal/reusable_view/sm_button.dart';
import 'package:sm_admin_portal/reusable_view/sm_text.dart';
import 'package:sm_admin_portal/utilily/colors.dart';
import 'package:sm_admin_portal/utilily/strings.dart';

class SkyDashboardView extends StatefulWidget {
  const SkyDashboardView({super.key});

  @override
  State<SkyDashboardView> createState() => _SkyDashboardViewState();
}

class _SkyDashboardViewState extends State<SkyDashboardView> {
  RxList<List<CustomTableViewModel>> purchaseList =
      <List<CustomTableViewModel>>[].obs;
  @override
  void initState() {
    purchaseList.add([
      CustomTableViewModel(title: SubscriptionStatusStr, isVisible: true.obs),
      CustomTableViewModel(title: tempStatusStr, isVisible: true.obs),
      CustomTableViewModel(title: lastRenewedStr, isVisible: true.obs),
      CustomTableViewModel(title: nextRenewalDateStr, isVisible: true.obs),
    ]);
    for (int i = 0; i < 6; i++) {
      purchaseList.add(
        [
          CustomTableViewModel(
              value: 'toneName${i}', isVisible: true.obs, isButton: true),
          CustomTableViewModel(
              value: 'toneId${i}', isVisible: true.obs, isButton: true),
          CustomTableViewModel(value: '30/05/2024', isVisible: true.obs),
          CustomTableViewModel(value: '30/06/2024', isVisible: true.obs),
        ],
      );
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTableView(
        child: (row, colum) {
          return colum == 0
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Column(
                        children: [
                          SMText(
                            title: row == 1 ? "DeActivate" : "Activate",
                            textColor: row == 1 ? redColor : greenColor,
                          ),
                          SMText(title: "CRBT"),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SMButton(
                                titlePadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                height: 30,
                                fontWeight: FontWeight.normal,
                                title: row == 1 ? "Activate" : "Deactivate",
                                textColor: white,
                                bgColor: row == 1 ? greenColor : redColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SMText(
                        title: row == 1 ? "DeActivate" : "Activate",
                        textColor: row == 1 ? redColor : greenColor,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SMButton(
                            titlePadding: EdgeInsets.symmetric(horizontal: 8),
                            height: 30,
                            fontWeight: FontWeight.normal,
                            title: row == 1 ? "Activate" : "Deactivate",
                            textColor: white,
                            bgColor: row == 1 ? greenColor : redColor,
                          ),
                        ],
                      )
                    ],
                  ),
                );
        },
        headerColumList: purchaseList[0],
        rowList: purchaseList);
  }
}
