import 'package:flutter/material.dart';
import 'package:recipe_app_practice/views/recipe/components/home_recipe_card.dart';
import 'package:recipe_app_practice/views/home/components/app_item_container.dart';
import 'package:recipe_app_practice/widgets/app_text_field.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';

class Body1 extends StatefulWidget {
  const Body1({Key? key}) : super(key: key);

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 5, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                const Expanded(child: AppTextField()),
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
            TabBar(
                isScrollable: true,
                controller: _tabController,
                indicator: 
                BoxDecoration(
                  color: Colors.green,borderRadius: BorderRadius.circular(10)),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const <Widget>[
                  AppItem(item: "All",),
                  AppItem(item: "Sushi",),
                  AppItem(item: "Burger",),
                  AppItem(item: "Pizza",),
                  AppItem(item: "Drinks",)
                ]),
            // const SizedBox(height: 50, child: AppItem()),
            const SizedBox(height: 5),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  HomeRecipeCard(),
                  HomeRecipeCard(),
                  HomeRecipeCard(),
                  HomeRecipeCard(),
                  HomeRecipeCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
