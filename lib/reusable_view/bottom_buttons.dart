import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'records_per_page_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RecordsPageButton(),
        // SizedBox(width: 100),
       // Text('Page'),
       // SizedBox(width: 100),
        Center(
          child: Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(255, 220, 218, 218),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: Text('1')),
          ),
        ),
       // SizedBox(width: 10),
        Text('of 1'),
       // SizedBox(width: 86),
        Flexible(
          child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                border: Border(
                    left: BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218)),
                    top: BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218)),
                    bottom: BorderSide(
                        color: const Color.fromARGB(255, 220, 218, 218))),
              ),
              child: Center(
                  child: Icon(Icons.fast_rewind,
                      color: Colors.grey[400], size: 16))),
        ),
        Flexible(
          child: Container(
            width: 28,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                  left:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  top:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  bottom: BorderSide(
                      color: const Color.fromARGB(255, 220, 218, 218))),
            ),
            child: Center(
              child: Center(
                child:
                    Icon(Icons.skip_previous, color: Colors.grey[400], size: 16),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
              width: 26,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[500],
              ),
              child: Center(
                  child: Text('1', style: TextStyle(color: Colors.white)))),
        ),
        Flexible(
          child: Container(
            width: 28,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(
                  right:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  top:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  bottom: BorderSide(
                      color: const Color.fromARGB(255, 220, 218, 218))),
            ),
            child: Center(
                child: Icon(Icons.skip_next, color: Colors.grey[400], size: 16)),
          ),
        ),
        Flexible(
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border(
                  right:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  top:
                      BorderSide(color: const Color.fromARGB(255, 220, 218, 218)),
                  bottom: BorderSide(
                      color: const Color.fromARGB(255, 220, 218, 218))),
            ),
            child: Flexible(
              child: Center(
                child: Icon(Icons.fast_forward, color: Colors.grey[700], size: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
