import 'package:get/get.dart';
import 'package:taskmanager/data/models/task_model.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_wrapper_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';

class NewTaskController extends GetxController {
  bool _getTaskInprogress= false;
  List<TaskModel> _taskList = [];
  String _errorMessage = '';
  bool get getTaskInprogress => _getTaskInprogress;
  List<TaskModel> get newTaskList =>_taskList;
  String get errorMessage => _errorMessage;

  Future<bool> getNewTasks() async {
    bool isSuccess=false;
    _getTaskInprogress = true;
   update();

    NetworkResponse response =
    await NetworkCaller.getRequest(Urls.newTasks);


    if(response.isSuccess){
      TaskListWrapperModel taskListWrapperModel =
      TaskListWrapperModel.fromJson(response.responseData);
      _taskList = taskListWrapperModel.taskModel ?? [];
      isSuccess = true;
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage ?? 'Failed';
    }

    _getTaskInprogress = false;
    update();

    return isSuccess;

  }
}