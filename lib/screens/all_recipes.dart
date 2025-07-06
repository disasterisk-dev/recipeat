import 'package:flutter/material.dart';
import 'package:recipeat/components/corner_button.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/new_recipe_modal.dart';
import 'package:recipeat/components/recipe_card.dart';

class AllRecipes extends StatelessWidget {
  const AllRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("All Recipes", Icons.home_rounded),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 2 / 3,
              children: List.generate(15, (index) {
                return RecipeCard(title: "Recipe #$index");
              }),
            ),
          ),
          CornerButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: false,
                showDragHandle: true,
                useSafeArea: true,
                context: context,
                builder: (BuildContext ctx) {
                  return NewRecipeModal();
                },
              );
            },
            child: Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
