import 'package:flutter/material.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_item.dart';
import 'package:recipe_app_practice/views/recipe/recipe_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_practice/views/recipe/recipe_view_model/recipe_view_model.dart';

final _homeRecipeCardProvider =
    ChangeNotifierProvider((ref) => RecipeViewModel());

class HomeRecipeCard extends ConsumerStatefulWidget {
  const HomeRecipeCard({Key? key}) : super(key: key);
  @override
  ConsumerState<HomeRecipeCard> createState() => _HomeRecipeCardState();
}

class _HomeRecipeCardState extends ConsumerState<HomeRecipeCard> {
  @override
  initState() {
    final model = ref.read(_homeRecipeCardProvider);
    Future.delayed(const Duration(seconds: 2), () => model.getRecipe());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(_homeRecipeCardProvider);
    return model.recipe.isEmpty? const RecipeItemSkeleton():Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: model.recipe.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child:  GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeView(
                recipeModel: model.recipe[index],
                food: model.recipe[index].recipe,
                image: model.recipe[index].image,
                spice: "Ingredients(${model.recipe[index].ingredient.length}) ",
              ),
            ),
          ),
          child: RecipeItem(
            source: model.recipe[index].source,
            food: model.recipe[index].recipe,
            image: model.recipe[index].image,
            text: "${model.recipe[index].ingredient.length} Ingredients",
            time: "${model.recipe[index].time} mins",
          ),
        ),
      ),
    ));
  }
}
