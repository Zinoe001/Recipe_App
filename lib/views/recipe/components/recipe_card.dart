import 'package:flutter/material.dart';
import 'package:recipe_app_practice/models/recipe_model.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_item.dart';
import 'package:recipe_app_practice/views/recipe/recipe_view.dart';


class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key,required this.recipeModel}) : super(key: key);

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child:  GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipeView(
            recipeModel: recipeModel,
            food: recipeModel.recipe,
            image: recipeModel.image,
            spice: "Ingredients(${recipeModel.ingredient.length}) ",
          ),
        ),
      ),
      child: RecipeItem(
        source: recipeModel.source,
        food: recipeModel.recipe,
        image: recipeModel.image,
        text: "${recipeModel.ingredient.length} Ingredients",
        time: "${recipeModel.time} mins",
      ),
    ),
      );
  }
}
