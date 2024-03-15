import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'popover_list.dart';

void main() {
  runApp(PopoverExample());
}

class PopoverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: const SafeArea(
          child: Center(
            child: Button(),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
      ),
      child: TextButton(
        onPressed: () {
          showPopover(
            context: context,
            bodyBuilder: (context) => ListItems(),
            direction: PopoverDirection.bottom,
            width: 200,
            height: 180,
            arrowHeight: 10,
            arrowWidth: 20,
          );
        },
        child: const Center(child: Text('Click Me')),
      ),
    );
  }
}
