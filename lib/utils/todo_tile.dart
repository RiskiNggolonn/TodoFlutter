import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  // style Card yang akan digunakan sebagai penampil task
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

        // Menampilkan Card
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4.0,
          color: Colors.white,
          child: Row(
            children: [
              // Widget Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
