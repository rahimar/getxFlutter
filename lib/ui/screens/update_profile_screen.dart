import 'dart:html';

import 'package:flutter/material.dart';
import 'package:taskmanager/ui/controller/auth_controller.dart';
import 'package:taskmanager/ui/widgets/background_widget.dart';
import 'package:taskmanager/ui/widgets/profile_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _fnTEController = TextEditingController();
  final TextEditingController _lnTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userData =  AuthController.userData!;
    _emailTEController.text = userData.email ?? '';
    _fnTEController.text = userData.firstName ?? '';
    _lnTEController.text = userData.lastName ?? '';
    _mobileTEController.text = userData.mobile ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, true),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height:48),
                Text('Update Profile', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                _buildPhotoPicker(),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  enabled: false,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _fnTEController,
                  decoration: const InputDecoration(
                      hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _lnTEController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passTEController,
                  decoration: const InputDecoration(
                      hintText: 'Password'
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: (){},
                    child: const Icon(Icons.arrow_forward_outlined),
                ),
                const SizedBox(height: 16),
          
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
              width: double.maxFinite,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              alignment: Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color:Colors.grey
                ),
                alignment: Alignment.center,
                child: const Text('Photo', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color:Colors.white,
                ),),
              ),
            );
  }
}
