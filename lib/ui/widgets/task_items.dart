import 'package:flutter/material.dart';
import 'package:taskmanager/data/models/task_model.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        title:  Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(taskModel.description ?? ''),
             Text(taskModel.createdDate ?? '', style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text('New'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8,vertical: 2
                  ),
                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}