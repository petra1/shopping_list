import 'package:flutter/material.dart';
import 'package:shopping_list/utils/shopping_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List shoppingList = [
    ['Brot', false],
    ['Milch', false],
    ['Butter', false],
  ];

  void checkoxChanged(int index) {
    setState(() {
      shoppingList[index][1] = !shoppingList[index][1];
    });
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Shopping List',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (BuildContext context, index) {
          return ShoppingList(
            taskName: shoppingList[index][0],
            taskCompleted: shoppingList[index][1],
            onChanged: (value)=> checkoxChanged(index),
          
          );
        },
      ),
    );
  }
}
