import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/ui/screens/auth/reset_pass_screen.dart';
import 'package:taskmanager/ui/screens/auth/sign_in_screen.dart';
import 'package:taskmanager/ui/screens/auth/sign_up_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';
import 'package:taskmanager/ui/widgets/background_widget.dart';

class PinVerifyScreen extends StatefulWidget {
  const PinVerifyScreen({super.key});

  @override
  State<PinVerifyScreen> createState() => _PinVerifyScreenState();
}

class _PinVerifyScreenState extends State<PinVerifyScreen> {

  final TextEditingController _emailTEController  = TextEditingController();

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
                    'Pin Verification',
                     style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 digits pin',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: AppColors.themeColor,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    controller: _emailTEController,
                    appContext: context,



                  ),
                   const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: _onTapVerifyButton,
                      child: Text('Verify') ,
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
  void _onTapVerifyButton(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ResetPassScreen())
    );
  }



  @override
  void dispose(){
    _emailTEController.dispose();
    super.dispose();
  }


}
