import 'package:flutter/material.dart';
import 'package:flutter_recipe_list/models/recipe.api.dart';
import 'package:flutter_recipe_list/models/recipe.dart';
import 'package:flutter_recipe_list/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10.0,
            ),
            Text("Marissalynn's Menu"),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (ctx, idx) {
                return RecipeCard(
                    title: _recipes[idx].title,
                    rating: _recipes[idx].rating.toString(),
                    cookTime: _recipes[idx].cookTime,
                    thumbnailUrl: _recipes[idx].thumbnailUrl);
              },
            ),
    );
  }
}
