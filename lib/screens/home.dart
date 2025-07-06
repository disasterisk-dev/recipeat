import 'package:flutter/material.dart';
import 'package:recipeat/components/home_tile.dart';
import 'package:recipeat/components/corner_button.dart';
import 'package:recipeat/components/main_appbar.dart';
import 'package:recipeat/components/new_recipe_modal.dart';
import 'package:recipeat/screens/all_recipes.dart';
import 'package:recipeat/screens/lists.dart';
import 'package:recipeat/screens/meal_plan.dart';
import 'package:recipeat/screens/settings.dart';
import 'package:recipeat/theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar("Recipeat", Icons.restaurant_rounded),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(48),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  HomeTile(
                    text: "All Recipes",
                    bgColor: AppColors.brand,
                    icon: Icons.home_rounded,
                    width: 2,
                    height: 2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllRecipes(),
                        ),
                      );
                    },
                  ),
                  HomeTile(
                    text: "Meal Plan",
                    bgColor: AppColors.error,
                    icon: Icons.calendar_month_rounded,
                    width: 1,
                    height: 2,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MealPlan(),
                        ),
                      );
                    },
                  ),
                  HomeTile(
                    text: "Lists",
                    bgColor: AppColors.warning,
                    icon: Icons.list_rounded,
                    width: 1,
                    height: 1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Lists()),
                      );
                    },
                  ),
                  HomeTile(
                    text: "Settings",
                    bgColor: AppColors.info,
                    icon: Icons.settings_rounded,
                    width: 1,
                    height: 1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Settings(),
                        ),
                      );
                    },
                  ),
                ],
              ),
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
