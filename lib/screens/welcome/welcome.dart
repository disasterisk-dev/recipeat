import 'package:flutter/material.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/screens/welcome/sign_in.dart';
import 'package:recipeat/screens/welcome/sign_up.dart';
import 'package:recipeat/theme.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool isSignUpForm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.inverse),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_rounded, size: 64, color: AppColors.brand),
            TitleText("Welcome to Recipeat"),
            Expanded(child: SizedBox()),
            if (isSignUpForm) SignUpForm(),
            if (!isSignUpForm) SignInForm(),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUpForm = !isSignUpForm;
                });
              },
              child: LinkText(
                "Or ${isSignUpForm ? "sign in to your account" : "create an account"} instead.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
