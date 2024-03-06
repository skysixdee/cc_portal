/*import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
        body: Container(height: 20,width: 20,
        decoration:BoxDecoration(
          border: Border.all(),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Loading Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showCustomDialog(context);
            },
            child: Text('Show Alert'),
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.blue, // Customize the color if needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    radius: 20,
                  ),
                  SizedBox(height: 10),
                  Text('gshs'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Additional Text Below'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}