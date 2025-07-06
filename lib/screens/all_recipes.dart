import 'package:flutter/material.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/text_widgets.dart';

class AllRecipes extends StatelessWidget {
  const AllRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("All Recipes", Icons.home_rounded),
      body: Center(child: HeadingText("All Recipes")),
    );
  }
}
