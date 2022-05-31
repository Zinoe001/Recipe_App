import 'package:flutter/material.dart';
import 'package:recipe_app_practice/models/recipe_model.dart';
import 'package:recipe_app_practice/services/recipe_service.dart';
import 'package:recipe_app_practice/widgets/base_view_model.dart';

class RecipeViewModel extends BaseViewModel{
 final RecipeService _recipeServices = RecipeService();
  List<RecipeModel> recipe= [];
  List<RecipeModel> recipeList= [];
  final ScrollController scrollController = ScrollController();
  int page = 5;
  final TextEditingController searchController = TextEditingController();
 getRecipe(text)async{
   text = searchController.text;
   setBusy(ViewState.Busy);
   print("I'm on it");
   recipe = await _recipeServices.getRecipe(query:text =="" ? "all" : text,to: page);
   print("done");
   setBusy(ViewState.Idle);
}
getItem(item)async{
   setBusy(ViewState.Busy);
   print("I'm on it");
   recipe = await _recipeServices.getRecipe(query:item,to: page);
   print("done");
   setBusy(ViewState.Idle);
}

 getMore(item)async{
  setBusy(ViewState.Busy);
   print("I'm on it");
   recipe = await _recipeServices.getRecipe(query:item,to: page);
   recipeList.addAll(recipe);
   page = ++ page;
   print("done");
   setBusy(ViewState.Idle);
}

}