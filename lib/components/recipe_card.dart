import 'package:flutter/material.dart';
import 'package:recipeat/components/styled_button.dart';
import 'package:recipeat/components/text_widgets.dart';
import 'package:recipeat/theme.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.title});

  final String title;
  final String description = "This is really tasty";

  void makeRecipe() {
    print("Make recipe");
  }

  void deleteRecipe() {
    print("delete");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(title),
      child: Card(
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: AppColors.brand,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset("assets/img/pizza.jpg", fit: BoxFit.cover),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(title),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.hourglass_bottom_rounded,
                          color: AppColors.boldMuted,
                        ),
                        SubheadingText("25m"),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.soup_kitchen_rounded,
                          color: AppColors.boldMuted,
                        ),
                        SubheadingText("4"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
