import 'package:flutter/material.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });
  final String taskName;
  bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              checkColor: Colors.black,   
              activeColor: Theme.of(context).colorScheme.secondaryContainer, 
              side: BorderSide(color: Theme.of(context).colorScheme.secondaryContainer),),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
