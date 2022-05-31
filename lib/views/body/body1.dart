import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_card.dart';
import 'package:recipe_app_practice/views/home/components/app_item_container.dart';
import 'package:recipe_app_practice/views/recipe/components/recipe_item.dart';
import 'package:recipe_app_practice/views/recipe/recipe_view_model/recipe_view_model.dart';
import 'package:recipe_app_practice/widgets/app_text_field.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';

final _recipeCardProvider = ChangeNotifierProvider((ref) => RecipeViewModel());

class Body1 extends ConsumerStatefulWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  ConsumerState<Body1> createState() => _Body1State();
}

class _Body1State extends ConsumerState<Body1> {
  @override
  initState() {
    final model = ref.read(_recipeCardProvider);
    Future.delayed(const Duration(seconds: 10),
        () => model.getRecipe(model.searchController.text));
    model.scrollController.addListener(() {
      if (model.scrollController.position.pixels ==
              model.scrollController.position.maxScrollExtent &&
          !model.scrollController.position.outOfRange) {}
    });
    super.initState();
  }

  @override
  void dispose() {
    final model = ref.read(_recipeCardProvider);
    model.scrollController.removeListener(() {});
    super.dispose();
  }

  int? _selectIndex = 0;
  List<String> item = ["all", "sushi", "burger", "rice", "beans", "wheat"];
  @override
  Widget build(BuildContext context) {
    final model = ref.watch(_recipeCardProvider);

    // Future _loadData() async {
    //   model.getRecipe(model.searchController.text);
    //   setState(() {
    //     data.addAll(model.recipe);
    //     isLoading = true;
    //   });
    // }

    return SafeArea(
      child: ListView(
        controller: model.scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const Text(
            "Find Best Recipe",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ),
          const Text(
            "for cooking",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                  child: AppTextField(
                searchController: model.searchController,
                onSubmitted: ((value) {
                  _selectIndex = value == "" ? 0 : null;
                  model.recipe = [];
                  model.getRecipe(value);
                  setState(() {});
                }),
              )),
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  RecipeApp.flow_parallel,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        model.getItem(item[index]);
                        model.recipe = [];
                        _selectIndex = index;
                        setState(() {});
                      },
                      child: AppItem(
                        item: item[index].toUpperCase(),
                        backgroundColor:
                            _selectIndex == index ? Colors.green : Colors.white,
                        textColor:
                            _selectIndex == index ? Colors.white : Colors.grey,
                      ),
                    )),
          ),
          const SizedBox(height: 5),
          ...List.generate(
              model.recipe.length,
              (index) => model.recipe.isEmpty
                  ? const RecipeItemSkeleton()
                  : RecipeCard(
                      recipeModel: model.recipe[index],
                    ))
        ],
      ),
    );
  }
}
