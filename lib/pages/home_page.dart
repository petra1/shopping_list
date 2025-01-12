import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List shoppingList = [
    ['Brot', false],
    ['Milch', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shopping List',
        ),
         backgroundColor: Theme.of(context).colorScheme.primary,
         foregroundColor: Colors.white    ,
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Text(shoppingList[index][0], style: TextStyle(color: Colors.white),),
            ),
          );
        },
      ),
    );
  }
}
