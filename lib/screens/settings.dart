import 'package:flutter/material.dart';
import 'package:recipeat/components/text_widgets.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(Icons.restaurant_rounded),
        centerTitle: false,
        actions: [],
      ),
      body: Center(child: HeadingText("Settings")),
    );
  }
}
