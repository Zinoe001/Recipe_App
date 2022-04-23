import 'package:flutter/material.dart';
import 'package:recipe_app_practice/models/ingredient_model.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_card.dart';

class RecipeIngredientCard extends StatelessWidget {
  const RecipeIngredientCard({Key? key, required this.ingredientList})
      : super(key: key);
  final List<IngredientsModel> ingredientList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredientList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: ingredientList.isEmpty?
        RecipeCard(
          image: ingredientList[index].image,
          ingredient: ingredientList[index].item,
          amount: ingredientList[index].amount,
        ): RecipeCard(
          image: ingredientList[index].image,
          ingredient: ingredientList[index].item,
          amount: ingredientList[index].amount,
        ),
      ),
    );
  }
}
