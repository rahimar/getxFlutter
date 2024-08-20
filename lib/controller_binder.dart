import 'package:get/get.dart';
import 'package:taskmanager/ui/controller/add_task_controller.dart';
import 'package:taskmanager/ui/controller/new_task_controller.dart';
import 'package:taskmanager/ui/controller/sign_in_controller.dart';
import 'package:taskmanager/ui/controller/sign_up_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => NewTaskController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => AddTaskController());
  }

}