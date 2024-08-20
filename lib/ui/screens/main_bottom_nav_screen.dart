import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/cancel_task_screen.dart';
import 'package:taskmanager/ui/screens/completed_task_screen.dart';
import 'package:taskmanager/ui/screens/in_progress_task_screen.dart';
import 'package:taskmanager/ui/screens/new_task_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';
import 'package:taskmanager/ui/widgets/profile_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressTaskScreen(),
    CancelTaskScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex = index;
          if(mounted){
            setState(() {});
          }
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc),label:'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.done),label:'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit),label:'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.close),label:'Cancelled'),
        ],
      ),
    );
  }
}
