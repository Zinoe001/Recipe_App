import 'package:flutter/material.dart';
import 'package:recipe_app_practice/models/ingredient_model.dart';
import 'package:recipe_app_practice/models/recipe_model.dart';
import 'package:recipe_app_practice/services/recipe_service.dart';
import 'package:recipe_app_practice/widgets/base_view_model.dart';

class RecipeViewModel extends BaseViewModel{
 final RecipeService _recipeServices = RecipeService();
  List<RecipeModel> recipe= [];
  List<IngredientsModel> item = [];
 getRecipe()async{
   setBusy(ViewState.Busy);
   print("I'm on it");
   recipe = await _recipeServices.getRecipe();
   print("done");
   setBusy(ViewState.Idle);
}
getItem()async{
   setBusy(ViewState.Busy);
   print("I'm on it");
   item = await _recipeServices.getIngredient();
   print("done");
   setBusy(ViewState.Idle);
}
}