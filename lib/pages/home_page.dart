import 'package:flutter/material.dart';
import 'package:shopping_list/utils/shopping_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final _controller = TextEditingController();

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

  void saveNewTask () {
    setState(() {
      shoppingList.add([_controller.text, false ]);
      _controller.clear();  
    });
  }

  void deleteTask(int index) {
    setState(() {
      shoppingList.removeAt(index);
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
            onChanged: (value) => checkoxChanged(index),
           deleteFunction: (contex) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller:  _controller ,
                  decoration: InputDecoration(
                    hintText:  'Add a new item',
                    filled: true,
                    fillColor: Color.fromARGB(50, 4, 117, 4),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      borderRadius: BorderRadius.circular(18)
                    ),
                     focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.secondaryContainer ,
                        
                      ),
                      borderRadius: BorderRadius.circular(18)
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
