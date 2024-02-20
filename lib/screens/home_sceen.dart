import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                color: Colors.red,
                height: 200,
                width: 200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
