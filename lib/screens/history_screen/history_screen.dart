import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/reusable_view/search_number/search_number_view.dart';
import 'package:sm_admin_portal/screens/history_screen/widgets/history_search_view.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          children: [
            searchView(),
          ],
        ),
      ),
    );
  }

  Widget searchView() {
    return HistorySearchView(
      textController: TextEditingController(),
    );
  }
}
