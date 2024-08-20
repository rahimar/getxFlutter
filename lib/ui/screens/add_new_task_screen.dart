import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/ui/controller/add_task_controller.dart';
import 'package:taskmanager/ui/widgets/background_widget.dart';
import 'package:taskmanager/ui/widgets/profile_app_bar.dart';

import '../../data/models/network_response.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';
import '../widgets/snack_bar_message.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _desTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _addTaskInprogress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter Title';
                      }
                      return null;
                    }
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _desTEController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                    validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter Description';
                  }
                  return null;
                }
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _addNewTask();
                      }
                    },
                    child: const Text('Add'),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addNewTask() async {

    final AddTaskController addTaskController =  Get.find<AddTaskController>();
    final bool result = await addTaskController.addTask (
      _titleTEController.text.trim(),
        _desTEController.text.trim(),
    );
    if(result){
      _clearTextField();
      if(mounted){
        showSnackBarMessage(context, 'Add New Task Added');
      }
    }else{
      if(mounted){
        showSnackBarMessage(context, addTaskController.errorMessage);
      }
    }


  }

  void _clearTextField(){
    _titleTEController.clear();
    _desTEController.clear();
  }

  @override
  void dispose(){
    _titleTEController.dispose();
    _desTEController.dispose();
    super.dispose();
  }

}


