import 'package:flutter/material.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/text_widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("Settings", Icons.settings_rounded),
      body: Center(child: HeadingText("Settings")),
    );
  }
}
