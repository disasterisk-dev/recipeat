import 'package:flutter/material.dart';
import 'package:recipeat/components/styled_button.dart';
import 'package:recipeat/components/text_input.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/services/auth_service.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorFeedback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // intro text
            Center(child: SubheadingText("Sign in to your Recipeat account!")),
            SizedBox(height: 32),

            // email field
            StyledTextInput(
              controller: _emailController,
              inputType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address";
                }

                return null;
              },
              label: "Email Address",
            ),
            SizedBox(height: 16),

            // password field
            StyledTextInput(
              controller: _passwordController,
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a password";
                }

                return null;
              },
              label: "Password",
            ),
            SizedBox(height: 16),

            // error feedback
            if (errorFeedback != null) ErrorText(errorFeedback!),
            SizedBox(height: 16),

            // submit button
            StyledButton(
              onPressed: () async {
                setState(() {
                  errorFeedback = null;
                });

                if (_formKey.currentState!.validate()) {
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();

                  final userRes = await AuthService.signIn(email, password);

                  // error feedback
                  setState(() {
                    errorFeedback = userRes.error;
                  });
                }
              },
              child: ButtonText("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
