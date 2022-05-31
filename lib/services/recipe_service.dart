import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app_practice/models/recipe_model.dart';

class RecipeService {
  
    
     Future<List<RecipeModel>> getRecipe({ required String query,required int to}) async {
       try {
    http.Response response = await http.get(
      Uri.parse("https://api.edamam.com/search?app_id=045beb36&app_key=8367ae8d26be6a790b175a45df519012&q=$query&to=$to"),);
    final result = jsonDecode(response.body)["hits"];
    print(result);
    final List<RecipeModel> recipe =
        List<RecipeModel>.from(result.map((e) => RecipeModel.fromJson(e["recipe"])));
    return recipe;
    }catch(e) {
      print("Error is ${e.toString()}");
      rethrow;
    }
    }
  }