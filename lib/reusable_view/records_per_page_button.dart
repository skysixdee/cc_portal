import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../utilily/strings.dart';

class RecordsPageButton extends StatefulWidget {
  const RecordsPageButton({super.key});

  @override
  State<RecordsPageButton> createState() => _RecordsPageButtonState();
}

class _RecordsPageButtonState extends State<RecordsPageButton> {

  String _text = ' 5';
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      ResponsiveBuilder(builder: (context, sizingInformation) {
        return InkWell(
          onTap: () {
            showPopover(
              context: context,
              bodyBuilder: (context) => DropDownItems(),
              direction: PopoverDirection.bottom,
              width: 70,
              height: 120,
              arrowHeight: 10,
              arrowWidth: 20,
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 220, 218, 218),
                ),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_text),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        );
      }),
      SizedBox(width: 5),
      Text(RecordsPerPageStr, style: TextStyle(color: Colors.grey[800])),
    ],
  );
  }

   void _updateTextField(String text) {
    setState(() {
      _text = text;
    });
  }

  DropDownItems() {
  List<int> itemList = [5, 10, 15, 20, 25]; // List of items
  
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index) {
              int itemValue = itemList[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    _updateTextField('$itemValue');
                    print("index:$index");
                    print("selectedIndex:$_selectedIndex");
                  });
                   
                  
                },
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                       _selectedIndex == index?Icon(Icons.check):SizedBox(width:5), 
                       //Icon(Icons.check),
                        SizedBox(width:6),
                        Text(
                          '$itemValue',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
 }
}


