import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:taskmanager/ui/controller/auth_controller.dart';


import '../models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async{
    try{
      Response response = await get(Uri.parse(url), headers: {
        'token' : AuthController.accessToken,
      });
      if(response.statusCode == 200){
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData,
        );
      }else{
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false
        );
      }
    }catch(e){
      return NetworkResponse(
          statusCode: -1,
          isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(String url,{
    Map<String, dynamic>? body,
  }) async{
    try{
      debugPrint(body.toString());
      debugPrint(url);
      Response response = await post(Uri.parse(url),
      body: jsonEncode(body),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'token' : AuthController.accessToken,
            'Accept': '*/*'
          }
      );
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      if(response.statusCode == 200 || response.statusCode==201){
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodedData,
        );
      }else{
        debugPrint(response.statusCode.toString());
        debugPrint(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: false
        );
      }
    }catch(e){
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}