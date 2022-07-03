import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavouritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var categoryMealsItem = favoriteMeals[index];
          return MealItem(
            id: categoryMealsItem.id,
            title: categoryMealsItem.title,
            imageUrl: categoryMealsItem.imageUrl,
            duration: categoryMealsItem.duration,
            complexity: categoryMealsItem.complexity,
            affordability: categoryMealsItem.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
