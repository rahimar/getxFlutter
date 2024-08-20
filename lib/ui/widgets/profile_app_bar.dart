
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taskmanager/ui/controller/auth_controller.dart';
import 'package:taskmanager/ui/screens/auth/sign_in_screen.dart';
import 'package:taskmanager/ui/screens/update_profile_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';

import 'network_cached_image.dart';

AppBar profileAppBar(context, [bool fromUpdateProfile = false]){
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: const Padding(
    padding: EdgeInsets.all(8.0),
    child: CircleAvatar(
    child: NetworkCachedImage(
    url: '',
    ),
    ),
    ),
    title: GestureDetector(
      onTap: (){
        if(fromUpdateProfile){
          return;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context)=> const UpdateProfileScreen()
            ),
        );
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        AuthController.userData?.fullName ?? '',
        style: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      ),),
      Text(

          AuthController.userData?.email ?? '',
        style: const TextStyle(
      fontSize: 10,
      color: Colors.white,
        fontWeight: FontWeight.w500,
        ),)
        ],
        ),
    ),
  actions: [
  IconButton(onPressed: () async {
    await AuthController.clearAllData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const SignInScreen()),
            (route) => false,
    );
  },
      icon: const Icon(Icons.logout))
  ],
  );
}