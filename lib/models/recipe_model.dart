import 'package:recipe_app_practice/models/ingredient_model.dart';

class RecipeModel {
  RecipeModel({
    required this.recipe,
    required this.image,
    required this.ingredient,
    required this.source,
    required this.time
  }) : super();
  final String recipe;
  final String image;
  final List<IngredientsModel> ingredient;
  final String source;
  final double time;

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      recipe: json["label"],
      ingredient: List.from(json["ingredients"].map((e)=>IngredientsModel.fromJson(e))),
      image: json["image"],
      source: json["source"],
      time: json["totalTime"]

    );
  }
  Map<String, dynamic> toJson() => {
        "label": recipe,
        "ingredients": ingredient,
        "image": image,
        "totalTime":time,
        "source":source,
      };
}
