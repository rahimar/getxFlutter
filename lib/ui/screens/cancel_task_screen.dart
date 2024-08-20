import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/task_items.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemBuilder: (context, index){
            //return const TaskItems();
          }
      ),
    );
  }
}
