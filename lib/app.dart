import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/controller_binder.dart';
import 'package:taskmanager/ui/screens/auth/splash_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: const SplashScreen(),
      theme: lightThemeData(),
      initialBinding: ControllerBinder(),
    );
  }

  ThemeData lightThemeData(){
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: AppColors.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        )
      )
    );
  }

}
