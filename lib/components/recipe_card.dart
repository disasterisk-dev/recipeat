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
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: AppColors.inverse,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100,
              child: AspectRatio(
                aspectRatio: 10 / 16,
                child: Image.asset("assets/img/pizza.jpg", fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(title),
                    SubheadingText(description),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StyledButton(
                          onPressed: makeRecipe,
                          child: const Text("Make"),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            foregroundColor: AppColors.warning,
                          ),
                          onPressed: deleteRecipe,
                          icon: const Icon(Icons.delete),
                        ),
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
