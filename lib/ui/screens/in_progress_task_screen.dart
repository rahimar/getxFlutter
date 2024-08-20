import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/task_items.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
        itemBuilder: (context, index){
     // return const TaskItems();
    }
    ),
    );
  }
}
