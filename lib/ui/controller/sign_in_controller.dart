import 'package:get/get.dart';

import '../../data/models/login_model.dart';
import '../../data/models/network_response.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  bool _signUpInprogress = false;
  String _errorMessage = '';

  bool get signUpInprogress => _signUpInprogress;
  String get errorMessage => _errorMessage;

  Future<bool> signIN(String email, String password) async {
    bool isSuccess = false;
    _signUpInprogress = true;
    update();

    Map<String, dynamic> requestInput = {
      "email": email,
      "password": password,
    };
    NetworkResponse response = await NetworkCaller.postRequest(Urls.login, body: requestInput);



    if(response.isSuccess){
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage ?? 'Login Failed';
      isSuccess = false;
    }

    _signUpInprogress = false;
    update();

    return isSuccess;

  }
}