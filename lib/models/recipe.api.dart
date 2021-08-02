import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_recipe_list/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {'limit': '18', 'start': '0', 'tag': 'list.recipe.popular'});
    final response = await http.get(uri, headers: {
      'x-rapidapi-key': '4fd1b29448mshb463db226db72d4p15d8afjsned4a2114c387',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
