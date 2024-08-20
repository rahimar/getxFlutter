import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/auth/pin_verify_screen.dart';
import 'package:taskmanager/ui/screens/auth/sign_in_screen.dart';
import 'package:taskmanager/ui/screens/auth/sign_up_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';
import 'package:taskmanager/ui/widgets/background_widget.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {

  final TextEditingController _passTEController  = TextEditingController();
  final TextEditingController _confirmpassTEController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    'Reset Your Password',
                     style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Minimum 6 digits password',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmpassTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password'
                    ),
                  ),
                   const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Confirm'),
                  ),
                  const SizedBox(height: 36),
                  Center(
                    child: Column(
                      children: [

                        RichText(text: TextSpan(
                          style: TextStyle(
                            color:Colors.black.withOpacity(0.8),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                          ),
                          text: "Have account? ",
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: const TextStyle(
                                color: AppColors.themeColor,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = (){
                                _onTapSignINButton();
                              }
                            )
                          ],
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  void _onTapSignINButton(){
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
          (route)=>false,
    );
  }



  @override
  void dispose(){
    _passTEController.dispose();
    _confirmpassTEController.dispose();
    super.dispose();
  }


}
