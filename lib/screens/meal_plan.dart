import 'package:flutter/material.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/text_widgets.dart';

class MealPlan extends StatelessWidget {
  const MealPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("Meal Plan", Icons.calendar_month_rounded),
      body: Center(child: HeadingText("Meal Plan")),
    );
  }
}
