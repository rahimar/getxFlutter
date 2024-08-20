import 'package:get/get.dart';

import '../../data/models/network_response.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';

class SignUpController extends GetxController {

  bool _registrationInprogress = false;
  String _errorMessage = '';

  bool get registrationInprogress => _registrationInprogress;
  String get errorMessage => _errorMessage;

  Future<bool> registerUser(String email, String firstName, String lastName, String mobile, String password) async {
    bool isSuccess = false;
    _registrationInprogress = true;
    update();

    Map<String, dynamic> requestInput = {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    };
    NetworkResponse response = await NetworkCaller.postRequest(Urls.registration, body: requestInput);

    print(response.statusCode);
    print(response.errorMessage);

    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = response.errorMessage ?? 'Registration Success';
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage ?? 'Registration Failed';
    }
    _registrationInprogress = false;
    update();
    return isSuccess;
  }


}