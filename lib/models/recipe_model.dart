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
  final String image ;
  final List<IngredientsModel> ingredient;
  final String source;
  final double time;

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      recipe: json["label"],
      ingredient: List.from(json["ingredients"].map((e)=>IngredientsModel.fromJson(e))),
      image: json["image"]??="https://media.istockphoto.com/vectors/thumbnail-image-vector-grahic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27UapoyYpQm0anc=",
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
