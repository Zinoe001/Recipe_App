import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_practice/models/recipe_model.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_ingredient_card.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';

class RecipeView extends StatelessWidget {
  const RecipeView(
      {Key? key,
      required this.image,
      required this.spice,
      required this.food,
      required this.recipeModel})
      : super(key: key);
  final String image;
  final String spice;
  final String food;
  final RecipeModel recipeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        RecipeApp.left,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Text(
                      food,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      RecipeApp.more_horiz,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.brown.shade300,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            spice,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "1 Serving",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(
                    recipeModel.ingredient.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: RecipeIngredientCard(
                        image: recipeModel.ingredient[index].image,
                        ingredient: recipeModel.ingredient[index].item,
                        amount: recipeModel.ingredient[index].amount,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 65,
                    width: 195,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Start Cook!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          RecipeApp.right,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
