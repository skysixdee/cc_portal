import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        // appBar: AppBar(title:Text ('CCUI'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  'CCUI',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 300,
                    width: 400,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.white)),
                      color: Colors.white,
                      //border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in to your Account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              labelText: 'Username or email',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 18)
                              //border: OutlineInputBorder(),
                              ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 18
                                    // border: OutlineInputBorder(),
                                    ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                            height: 30,
                            width: 375,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
