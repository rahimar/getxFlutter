import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screens/auth/pin_verify_screen.dart';
import 'package:taskmanager/ui/screens/auth/sign_up_screen.dart';
import 'package:taskmanager/ui/utility/app.colors.dart';
import 'package:taskmanager/ui/widgets/background_widget.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {

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
                    'Your Email Address',
                     style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 digits pin',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _emailTEController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email'
                    ),
                  ),
                   const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: _onTapConfirmButton,
                      child: const Icon(Icons.arrow_circle_right_outlined),
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
    Navigator.pop(context);
  }

  void _onTapConfirmButton(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const PinVerifyScreen())
    );
  }

  @override
  void dispose(){
    _emailTEController.dispose();
    super.dispose();
  }


}
