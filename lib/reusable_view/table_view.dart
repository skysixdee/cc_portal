
import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TableView extends StatefulWidget {
  TableView({Key? key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  bool isChecked = false;
  bool _isHovered=false;
  List<TableModel> items = [];
@override
  void initState() {
    items = createList();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                  });
                                },
                                side: BorderSide(
                                    color: Color.fromARGB(255, 173, 171, 171))),
                            Text('Circle ID',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Circle Name',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Description',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Created Date',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 55),
                          child: Text('Assigned',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(
                          child: Text('Actions',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Obx((){
                                    return  Checkbox(
                                        value: items[index].isSelected.value,
                                        onChanged: (newValue) {
                                          items[index].isSelected.value=!items[index].isSelected.value;
                                          setState(() {
                                            print('checked$index');
                                            //isChecked = newValue!;
                                          });
                                        },
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 173, 171, 171)));
                                    }),
                                    Text('Value'),
                                  ],
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(items[index].packId),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(items[index].packName),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(items[index].cretatedDate),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(child: Text(items[index].rbtType)),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Center(
                                  child: _buildHoverIconButton(index), //IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
                               )
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildHoverIconButton(int index){
    return MouseRegion(
      onEnter: (_){
        items[index].hoveredIndex.value = index;
        _handleHover(true);
      },

      onExit:(_){
        items[index].hoveredIndex.value = -1;
         _handleHover(false);
      },
      child:Obx((){
        return items[index].hoveredIndex == index ?  Row(
              children:[
                AnimatedOpacity(
                  duration:Duration(milliseconds: 1000),
                  opacity:0.6,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.visibility),iconSize: 15)
                ),
                AnimatedOpacity(
                  duration:Duration(milliseconds: 1000),
                  opacity:0.6,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.edit),iconSize: 15)
                ),
                AnimatedOpacity(
                  duration:Duration(milliseconds: 1000),
                  opacity:0.6,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.delete),iconSize: 15)
                ),
              ]
            ): AnimatedOpacity(
              duration:Duration(milliseconds: 1000),
              opacity: !_isHovered?0.7:1.0,
              child: IconButton(
                icon:Icon(Icons.more_horiz),
                onPressed:(){},
              ),
            );
      })
      
      // Row(
      //   mainAxisSize:MainAxisSize.min,
      //   children: [
          
      //       AnimatedOpacity(
      //         duration:Duration(milliseconds: 1000),
      //         opacity: !_isHovered?0.7:0.0,
      //         child: IconButton(
      //           icon:Icon(Icons.more_horiz),
      //           onPressed:(){},
      //         ),
      //       ),
          
           
      //   ])

    );
  }
  
  void _handleHover(bool isHovered) {
    setState(() {

      _isHovered=isHovered;
    });
  }

}



class TableModel {
  RxBool isSelected;
  String packId;
  String packName;
  String rbtType;
  String cretatedDate;
  String assigned;
  String action;
  RxInt hoveredIndex;
  TableModel(this.isSelected , this.packId, this.packName,this.rbtType,this.cretatedDate,this.assigned,this.action, this.hoveredIndex);
}

createList(){
  List<TableModel> lst = [];
  for (var i = 0; i < 24; i++) {
   
    lst.add(TableModel(false.obs,'packId $i', "packName$i", "rbtType$i", "cretatedDate$i", "assigned$i", "action$i",1.obs)); 
   lst[i].hoveredIndex.value = -1;
  }
  return lst;
}