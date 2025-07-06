import 'package:flutter/material.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/styled_button.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/services/auth_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("Profile", Icons.person_rounded, isProfile: true),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubheadingText("Email:"),
            BodyText("email@example.com"),
            Expanded(child: SizedBox()),
            StyledButton(
              onPressed: () {
                AuthService.signOut();
                Navigator.pop(context);
              },
              child: ButtonText("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
