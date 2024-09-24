// lib/main.dart

import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      title: 'Spaghetti Carbonara',
      description: 'A classic Italian pasta dish.',
      ingredients: 'Spaghetti, eggs, parmesan cheese, pancetta, pepper.',
      instructions: 'Cook spaghetti, mix with other ingredients, serve hot.',
    ),
    Recipe(
      title: 'BLT Sandwich',
      description: 'Simple and delicious sandwich.',
      ingredients: '2 Slices of bread, Bacon, Lettuce, Tomato.',
      instructions: 'Cook bacon and add to bread along with lettuce, and tomatoes.',
    ),
    Recipe(
      title: 'French Fries',
      description: 'Classic potato side dish, or snack',
      ingredients: 'Potatoes, oil',
      instructions: 'Cut potatoes into thin slices, then deep fry in oil.',
    )
    // Add more recipes as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipe.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(recipe.ingredients),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}
