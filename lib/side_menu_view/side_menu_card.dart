import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_list_view.dart';

Widget sideMenuCard({required String text, required bool isSelected}) {
  return Container(
      color: isSelected
          ? Color.fromRGBO(181, 231, 253, 1)
          : null, // Change the color when selected
      child: ListTile(
        title: Row(children: [
          Icon(
            Icons.circle,
            color: isSelected ? Colors.blue : Colors.white,
            size: 15,
          ),
          SizedBox(width: 11),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black, fontSize: 10),
            ),
          )
        ]),
      ));
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SideMenuListView(),
    ),
  ));
}
/*import 'package:flutter/material.dart';
import 'package:sm_admin_portal/side_menu_view/side_menu_list_view.dart';
Widget sideMenuCard({required String text, required bool isSelected}) {
  return Container(
    color: isSelected ? Colors.blue : null, // Change the color when selected
    child: ListTile(
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SideMenuListView(),
    ),
  ));
}*/

/*crct
import 'package:flutter/material.dart';

Widget sideMenuCard(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 1),
    child: Container(
      height: 40,
      child: Text(text),
    ),
  );
}*/


/*import 'package:flutter/material.dart';

Widget sideMenuCard({required String text,required bool isSelected }) {
  return Card(
    color: isSelected ? Colors.blue : null,

    // padding: const EdgeInsets.only(bottom: 1),
    child: ListTile(
      //height: 40,
      title: Text(text),
    ),
  );
}*/
