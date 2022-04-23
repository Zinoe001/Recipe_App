import 'package:flutter/material.dart';
import 'package:recipe_app_practice/widgets/recipe_custom_icons.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child:  TextFormField(
        decoration:const InputDecoration(
            prefixIcon: Icon(
              RecipeApp.search,
              color: Colors.grey,
            ),
            hintText: "Search Recipe",
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            border: InputBorder.none
            // enabledBorder: OutlineInputBorder(),
            // disabledBorder: OutlineInputBorder()
            ),
      ),
    );
  }
}
