import 'package:flutter/material.dart';

class ListItems extends StatefulWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute<SecondRoute>(
                    builder: (context) => SecondRoute(),
                  ),
                );


            },
            child: Container(
              height: 30,
              decoration: const BoxDecoration(
                color: const Color.fromRGBO(243, 229, 245, 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Center(
                  child: Text('Entry A',
                      style: TextStyle(
                          fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
            ),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: const Color.fromRGBO(225, 190, 231, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry B',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: const Color.fromRGBO(206, 147, 216, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry C',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: const Color.fromRGBO(186, 104, 200, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry D',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color:const Color.fromRGBO(156, 39, 176, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry E',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color: const Color.fromRGBO(142, 36, 170, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry F',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
          const Divider(),
          Container(
            height: 30,
            decoration: const BoxDecoration(
              color:const Color.fromRGBO(123, 31, 162, 1),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
                child: Text('Entry G',
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w900))),
          ),
        ],
      ),
    );
  }

  
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}


