import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/task_items.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(

      body: ListView.builder(
          itemBuilder: (context, index){
         //   return const TaskItems();
          }
      ),
    );
  }
}
