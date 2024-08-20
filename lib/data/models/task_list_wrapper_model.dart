import 'package:taskmanager/data/models/task_model.dart';

class TaskListWrapperModel {
  String? status;
  List<TaskModel>? taskModel;

  TaskListWrapperModel({this.status, this.taskModel});

  TaskListWrapperModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskModel = <TaskModel>[];
      json['data'].forEach((v) {
        taskModel!.add(TaskModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (taskModel != null) {
      data['data'] = taskModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
