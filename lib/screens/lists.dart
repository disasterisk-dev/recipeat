import 'package:flutter/material.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/text_widgets.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("Lists", Icons.list_rounded),
      body: Center(child: HeadingText("Lists")),
    );
  }
}
