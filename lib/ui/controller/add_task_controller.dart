import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';

class AddTaskController extends GetxController {

  bool _addTaskInprogress = false;
  String _errorMessage = '';

  bool get addTaskInprogress => _addTaskInprogress;
  String get errorMessage => _errorMessage;

  Future<bool> addTask(String title, String description) async {
    bool isSuccess = false;
    _addTaskInprogress = true;
   update();

    Map<String, dynamic> requestInput = {
      "title": title,
      "description": description,
    };
    NetworkResponse response = await NetworkCaller.postRequest(Urls.createTask, body: requestInput);


    print(response.statusCode);
    print(response.errorMessage);

    if(response.isSuccess){
      _errorMessage = 'Add Task Success';
      isSuccess = false;
    }else{
      _errorMessage = response.errorMessage ?? 'Add Task Failed';
      isSuccess = false;
    }
    _addTaskInprogress = false;
    update();
    return isSuccess;
  }
}