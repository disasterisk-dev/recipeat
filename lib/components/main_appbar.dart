import 'package:flutter/material.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/screens/profile.dart';
import 'package:recipeat/theme.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  MainAppbar(this.title, this.icon, {super.key, this.isProfile = false});

  final String title;
  final IconData icon;
  bool isProfile;

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Icon(icon, size: 32), TitleText(title)],
      ),
      centerTitle: false,
      actions: !isProfile
          ? [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                icon: Icon(Icons.person_rounded, size: 32),
              ),
            ]
          : [],
    );
  }
}
